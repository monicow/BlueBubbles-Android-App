import 'dart:async';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:bluebubbles/blocs/chat_bloc.dart';
import 'package:bluebubbles/blocs/message_bloc.dart';
import 'package:bluebubbles/helpers/contstants.dart';
import 'package:bluebubbles/helpers/hex_color.dart';
import 'package:bluebubbles/helpers/socket_singletons.dart';
import 'package:bluebubbles/helpers/utils.dart';
import 'package:bluebubbles/layouts/conversation_details/conversation_details.dart';
import 'package:bluebubbles/layouts/conversation_view/conversation_view.dart';
import 'package:bluebubbles/layouts/conversation_view/new_chat_creator/contact_selector_option.dart';
import 'package:bluebubbles/layouts/widgets/CustomCupertinoNavBackButton.dart';
import 'package:bluebubbles/layouts/widgets/CustomCupertinoNavBar.dart';
import 'package:bluebubbles/layouts/widgets/contact_avatar_widget.dart';
import 'package:bluebubbles/layouts/widgets/theme_switcher/theme_switcher.dart';
import 'package:bluebubbles/managers/contact_manager.dart';
import 'package:bluebubbles/managers/current_chat.dart';
import 'package:bluebubbles/managers/event_dispatcher.dart';
import 'package:bluebubbles/managers/new_message_manager.dart';
import 'package:bluebubbles/managers/notification_manager.dart';
import 'package:bluebubbles/managers/settings_manager.dart';
import 'package:bluebubbles/repository/models/chat.dart';
import 'package:bluebubbles/repository/models/handle.dart';
import 'package:bluebubbles/repository/models/message.dart';
import 'package:bluebubbles/repository/models/settings.dart';
import 'package:bluebubbles/socket_manager.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart' as Cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

mixin ConversationViewMixin<ConversationViewState extends StatefulWidget>
    on State<ConversationView> {
  /// Commonly shared variables
  Chat chat;
  bool isCreator;
  MessageBloc messageBloc;

  /// Regular conversation view variables
  OverlayEntry entry;
  LayerLink layerLink = LayerLink();
  List<String> newMessages = [];
  bool processingParticipants = false;

  /// Chat selector variables
  List<Chat> conversations = [];
  List<UniqueContact> contacts = [];
  List<UniqueContact> selected = [];
  List<UniqueContact> prevSelected = [];
  String searchQuery = "";
  bool currentlyProcessingDeleteKey = false;
  CurrentChat currentChat;
  Settings _settingsCopy;
  List<DisplayMode> modes;
  DisplayMode currentMode;
  Brightness brightness;
  Color previousBackgroundColor;
  bool gotBrightness = false;
  bool markingAsRead = false;
  bool markedAsRead = false;
  void loadBrightness() {
    Color now = Theme.of(context).backgroundColor;
    bool themeChanged =
        previousBackgroundColor == null || previousBackgroundColor != now;
    if (!themeChanged && gotBrightness) return;

    previousBackgroundColor = now;
    if (this.context == null) {
      brightness = Brightness.light;
      gotBrightness = true;
      return;
    }

    bool isDark = now.computeLuminance() < 0.179;
    brightness = isDark ? Brightness.dark : Brightness.light;
    gotBrightness = true;
    if (this.mounted) setState(() {});
  }

  TextEditingController chatSelectorController =
      new TextEditingController(text: " ");

  /// Conversation view methods
  ///
  ///
  /// ===========================================================
  void initConversationViewState() {
    if (isCreator) return;
    NotificationManager().switchChat(chat);

    fetchParticipants();
    ContactManager().stream.listen((List<String> addresses) async {
      fetchParticipants();
    });

    EventDispatcher().stream.listen((Map<String, dynamic> event) {
      if (!["add-unread-chat", "remove-unread-chat", "refresh-messagebloc"]
          .contains(event["type"])) return;
      if (!event["data"].containsKey("chatGuid")) return;

      // Ignore any events having to do with this chat
      String chatGuid = event["data"]["chatGuid"];
      if (chat.guid == chatGuid) return;

      int preLength = newMessages.length;
      if (event["type"] == "add-unread-chat" &&
          !newMessages.contains(chatGuid)) {
        newMessages.add(chatGuid);
      } else if (event["type"] == "remove-unread-chat" &&
          newMessages.contains(chatGuid)) {
        newMessages.remove(chatGuid);
      }

      // Only re-render if the newMessages count changes
      if (preLength != newMessages.length && this.mounted) setState(() {});
    });

    // Listen for changes in the group
    NewMessageManager().stream.listen((NewMessageEvent event) async {
      // Make sure we have the required data to qualify for this tile
      if (event.chatGuid != widget.chat.guid) return;
      if (!event.event.containsKey("message")) return;

      // Make sure the message is a group event
      Message message = event.event["message"];
      if (!message.isGroupEvent()) return;

      // If it's a group event, let's fetch the new information and save it
      await fetchChatSingleton(widget.chat.guid);
      setNewChatData(forceUpdate: true);
    });
  }

  void setNewChatData({forceUpdate: false}) async {
    // Save the current participant list and get the latest
    List<Handle> ogParticipants = widget.chat.participants;
    await widget.chat.getParticipants();

    // Save the current title and generate the new one
    String ogTitle = widget.chat.title;
    await widget.chat.getTitle();

    // If the original data is different, update the state
    if (ogTitle != widget.chat.title ||
        ogParticipants.length != widget.chat.participants.length ||
        forceUpdate) {
      if (this.mounted) setState(() {});
    }
  }

  void didChangeDependenciesConversationView() {
    if (isCreator) return;
    SocketManager().removeChatNotification(chat);
  }

  void initCurrentChat(Chat chat) {
    currentChat = CurrentChat.getCurrentChat(chat);
    currentChat.init();
    currentChat.updateChatAttachments().then((value) {
      if (this.mounted) setState(() {});
    });

    currentChat.stream.listen((event) {
      if (this.mounted) setState(() {});
    });
  }

  MessageBloc initMessageBloc() {
    messageBloc = new MessageBloc(chat);
    return messageBloc;
  }

  void disposeConversationView() {
    messageBloc?.dispose();
    // NotificationManager().leaveChat();
    super.dispose();
  }

  Future<void> fetchParticipants() async {
    if (isCreator) return;
    // Prevent multiple calls to fetch participants
    if (processingParticipants) return;
    processingParticipants = true;

    // If we don't have participants, get them
    if (chat.participants.isEmpty) {
      await chat.getParticipants();

      // If we have participants, refresh the state
      if (chat.participants.isNotEmpty) {
        if (this.mounted) setState(() {});
        return;
      }

      debugPrint("(Convo View) No participants found for chat, fetching...");

      try {
        // If we don't have participants, we should fetch them from the server
        Chat data = await fetchChatSingleton(chat.guid);
        // If we got data back, fetch the participants and update the state
        if (data != null) {
          await chat.getParticipants();
          if (chat.participants.isNotEmpty) {
            debugPrint(
                "(Convo View) Got new chat participants. Updating state.");
            if (this.mounted) setState(() {});
          } else {
            debugPrint(
                "(Convo View) Participants list is still empty, please contact support!");
          }
        }
      } catch (ex) {
        debugPrint("There was an error fetching the chat");
        debugPrint(ex.toString());
      }
    }

    processingParticipants = false;
  }

  Future<void> openDetails() async {
    Chat _chat = await chat.getParticipants();
    Navigator.of(context).push(
      ThemeSwitcher.buildPageRoute(
        builder: (context) => ConversationDetails(
          chat: _chat,
          messageBloc: messageBloc ?? initMessageBloc(),
        ),
      ),
    );
  }

  void markChatAsRead() {
    Function setProgress = (bool val) {
      if (this.mounted) {
        setState(() {
          markingAsRead = val;

          if (!val) {
            markedAsRead = true;
          }
        });
      }

      // Unset the marked icon
      Future.delayed(Duration(seconds: 3), () {
        if (this.mounted) {
          setState(() {
            markedAsRead = false;
          });
        }
      });
    };

    // Set that we are
    setProgress(true);

    SocketManager().sendMessage("mark-chat-read", {"chatGuid": chat.guid},
        (data) {
      setProgress(false);
    }).catchError(() {
      setProgress(false);
    });
  }

  Widget buildConversationViewHeader() {
    loadBrightness();
    Color backgroundColor = Theme.of(context).backgroundColor;
    Color fontColor = Theme.of(context).textTheme.headline1.color;

    if (SettingsManager().settings.skin == Skins.Material ||
        SettingsManager().settings.skin == Skins.Samsung) {
      return AppBar(
        brightness: brightness,
        title: Text(
          chat.title,
          style: Theme.of(context).textTheme.headline1.apply(color: fontColor),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Theme.of(context).dividerColor,
            height: 0.5,
          ),
          preferredSize: Size.fromHeight(0.5),
        ),
        backgroundColor: backgroundColor,
        actionsIconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        actions: [
          if (SettingsManager().settings.privateManualMarkAsRead &&
              markingAsRead)
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Center(
                    child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ))),
          if (SettingsManager().settings.enablePrivateAPI &&
              SettingsManager().settings.privateManualMarkAsRead &&
              !markingAsRead)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                child: Icon(
                  (markedAsRead)
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  color: (markedAsRead)
                      ? HexColor('32CD32').withAlpha(200)
                      : fontColor,
                ),
                onTap: markChatAsRead,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: Icon(
                Icons.more_vert,
                color: fontColor,
              ),
              onTap: openDetails,
            ),
          ),
        ],
      );
    }

    // Build the stack
    List<Widget> avatars = [];
    chat.participants.forEach((Handle participant) {
      avatars.add(
        Container(
          height: 42.0, // 2 px larger than the diameter
          width: 42.0, // 2 px larger than the diameter
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).accentColor,
            child: ContactAvatarWidget(
                handle: participant,
                borderThickness: 0.1,
                editable: false,
                onTap: openDetails),
          ),
        ),
      );
    });

    // Calculate separation factor
    // Anything below -60 won't work due to the alignment
    double distance = avatars.length * -4.0;
    if (distance <= -30.0 && distance > -60) distance = -30.0;
    if (distance <= -60.0) distance = -35.0;
    return CupertinoNavigationBar(
        backgroundColor: Theme.of(context).accentColor.withAlpha(125),
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 0.2),
        ),
        leading: CustomCupertinoNavigationBarBackButton(
          color: Theme.of(context).primaryColor,
          notifications: newMessages.length,
        ),
        middle: ListView(
          physics: Cupertino.NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(right: 5),
          children: <Widget>[
            Container(height: 10.0),
            GestureDetector(
              onTap: openDetails,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RowSuper(
                      children: avatars,
                      innerDistance: distance,
                      alignment: Alignment.center,
                    ),
                    Container(height: 5.0),
                    RichText(
                      maxLines: 1,
                      overflow: Cupertino.TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline2,
                        children: [
                          TextSpan(
                            text: chat.title,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: " >",
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        trailing: (SettingsManager().settings.enablePrivateAPI &&
                SettingsManager().settings.privateManualMarkAsRead)
            ? Stack(
                children: [
                  if (markingAsRead)
                    Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Theme(
                          data: ThemeData(
                            cupertinoOverrideTheme:
                                Cupertino.CupertinoThemeData(
                                    brightness: brightness),
                          ),
                          child: Cupertino.CupertinoActivityIndicator(
                            radius: 12,
                          ),
                        )),
                  if (!markingAsRead)
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: GestureDetector(
                        child: Icon(
                          (markedAsRead)
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                          color: (markedAsRead)
                              ? HexColor('32CD32').withAlpha(200)
                              : fontColor,
                        ),
                        onTap: markChatAsRead,
                      ),
                    ),
                ],
              )
            : Container(width: 33));
  }

  /// Chat selector methods
  ///
  ///
  /// ===========================================================
  void initChatSelector() {
    if (!isCreator) return;

    loadEntries();

    // Add listener to filter the contacts on text change
    chatSelectorController.addListener(() {
      if (chatSelectorController.text.length == 0) {
        if (selected.length > 0 && !currentlyProcessingDeleteKey) {
          currentlyProcessingDeleteKey = true;
          selected.removeLast();
          resetCursor();
          fetchCurrentChat();
          setState(() {});
          // Prevent deletes from occuring multiple times
          Future.delayed(Duration(milliseconds: 100), () {
            currentlyProcessingDeleteKey = false;
          });
        } else {
          resetCursor();
        }
      } else if (chatSelectorController.text[0] != " ") {
        chatSelectorController.text = " " +
            chatSelectorController.text
                .substring(0, chatSelectorController.text.length - 1);
        chatSelectorController.selection = TextSelection.fromPosition(
          TextPosition(offset: chatSelectorController.text.length),
        );
        setState(() {});
      }
      searchQuery = chatSelectorController.text.substring(1);
      filterContacts();
    });

    ChatBloc().chatStream.listen((List<Chat> chats) {
      if (this.mounted) loadEntries();
    });
  }

  void resetCursor() {
    if (!isCreator) return;
    chatSelectorController.text = " ";
    chatSelectorController.selection = TextSelection.fromPosition(
      TextPosition(offset: 1),
    );
  }

  Future<void> fetchCurrentChat() async {
    if (!isCreator) return;
    if (selected.length == 1 && selected.first.isChat) {
      chat = selected.first.chat;
    }

    Function clearCurrent = () {
      chat = null;
      messageBloc = null;
      if (this.mounted) setState(() {});
    };

    // If we don't have anything selected, reset the chat and message bloc
    if (selected.length == 0) {
      return clearCurrent();
    }

    // Check and see if there are any matching chats to the select participants
    List<Chat> matchingChats = [];

    // If it's just one recipient, try manual lookup
    if (selected.length == 1) {
      try {
        Chat existingChat = await Chat.findOne(
            {"chatIdentifier": sanitizeAddress(selected[0].address)});
        if (existingChat != null) {
          matchingChats.add(existingChat);
        }
      } catch (ex) {}
    }

    if (matchingChats.length == 0) {
      for (var i in ChatBloc().chats) {
        // If the lengths don't match continue
        if (i.participants.length != selected.length) continue;

        // Iterate over each selected contact
        int matches = 0;
        for (UniqueContact contact in selected) {
          // If the selected contact doesn't match any participants int he chat, continue
          if (i.participants.any((Handle participant) =>
              sameAddress(contact.address, participant.address))) {
            matches += 1;
          }
        }

        if (matches == selected.length) matchingChats.add(i);
      }
    }

    // If there are no matching chats, clear the chat and message bloc
    if (matchingChats.length == 0) {
      return clearCurrent();
    }

    // Sort the chats and take the first one
    matchingChats
        .sort((a, b) => a.participants.length.compareTo(b.participants.length));
    chat = matchingChats.first;

    // Re-initialize the current chat and message bloc for the found chats
    currentChat = CurrentChat.getCurrentChat(chat);
    messageBloc = initMessageBloc();

    // Tell the notification manager that we are looking at a specific chat
    await NotificationManager().switchChat(chat);
    if (this.mounted) setState(() {});
  }

  Future<void> loadEntries() async {
    if (!isCreator) return;
    if (isNullOrEmpty(ChatBloc().chats)) {
      await ChatBloc().refreshChats();
    }

    conversations = ChatBloc().chats;
    for (int i = 0; i < conversations.length; i++) {
      if (isNullOrEmpty(conversations[i].participants)) {
        await conversations[i].getParticipants();
      }
    }

    if (widget.type == ChatSelectorTypes.ONLY_EXISTING ||
        chatSelectorController.text.length > 1) {
      conversations.retainWhere((element) => element.participants.length > 1);
    }

    filterContacts();
    if (this.mounted) setState(() {});
  }

  void filterContacts() {
    if (!isCreator) return;
    if (selected.length == 1 && selected.first.isChat) {
      if (this.mounted)
        setState(() {
          contacts = [];
        });
    }
    searchQuery = (searchQuery ?? "");

    List<UniqueContact> _contacts = [];
    List<String> cache = [];
    Function addContactEntries = (Contact contact, {conditionally = false}) {
      for (Item phone in contact.phones) {
        String cleansed = cleansePhoneNumber(phone.value);
        if (conditionally && !cleansed.contains(searchQuery.toLowerCase()))
          continue;

        if (!cache.contains(cleansed)) {
          cache.add(cleansed);
          _contacts.add(
            new UniqueContact(
              address: phone.value,
              displayName: contact.displayName,
              label: phone.label,
            ),
          );
        }
      }

      for (Item email in contact.emails) {
        if (conditionally && !email.value.contains(searchQuery.toLowerCase()))
          continue;

        if (!cache.contains(email.value)) {
          cache.add(email.value);
          _contacts.add(
            new UniqueContact(
              address: email.value,
              displayName: contact.displayName,
              label: email.label,
            ),
          );
        }
      }
    };

    if (widget.type != ChatSelectorTypes.ONLY_EXISTING) {
      for (Contact contact in ContactManager().contacts) {
        String name = (contact.displayName ?? "").toLowerCase();
        if (name.contains(searchQuery.toLowerCase())) {
          addContactEntries(contact);
        } else {
          addContactEntries(contact, conditionally: true);
        }
      }
    }

    List<UniqueContact> _conversations = [];
    if (selected.length == 0 &&
        widget.type != ChatSelectorTypes.ONLY_CONTACTS) {
      for (Chat chat in conversations) {
        String title = (chat?.title ?? "").toLowerCase();
        if (widget.type != ChatSelectorTypes.ONLY_EXISTING &&
            chatSelectorController.text.length > 1) {
          if (chat.participants.length == 1) continue;
        }

        if (title.contains(searchQuery.toLowerCase())) {
          if (!cache.contains(chat.guid)) {
            cache.add(chat.guid);
            _conversations.add(
              new UniqueContact(
                chat: chat,
                displayName: chat.title,
              ),
            );
          }
        }
      }
    }
    _conversations.addAll(_contacts);
    if (searchQuery.length > 0)
      _conversations.sort((a, b) {
        if (a.isChat && !b.isChat) return 1;
        if (b.isChat && !a.isChat) return -1;
        if (!b.isChat && !a.isChat) return 0;
        return a.chat.participants.length.compareTo(b.chat.participants.length);
      });

    if (this.mounted)
      setState(() {
        contacts = _conversations;
      });
  }

  Future<Chat> createChat() async {
    if (chat != null) return chat;
    Completer<Chat> completer = Completer();
    if (searchQuery.length > 0) {
      selected.add(
          new UniqueContact(address: searchQuery, displayName: searchQuery));
    }
    List<String> participants =
        selected.map((e) => cleansePhoneNumber(e.address)).toList();
    Map<String, dynamic> params = {};
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            "Creating a new chat...",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                // height: 70,
                // color: Colors.black,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        );
      },
    );

    params["participants"] = participants;
    debugPrint("Starting chat with participants: ${participants.join(", ")}");

    Function returnChat = (Chat newChat) async {
      await newChat.save();
      await ChatBloc().updateChatPosition(newChat);
      completer.complete(newChat);
      Navigator.of(context).pop();
    };

    // If there is only 1 participant, try to find the chat
    Chat existingChat;
    if (participants.length == 1) {
      existingChat = await Chat.findOne(
          {"chatIdentifier": sanitizeAddress(participants[0])});
    }

    if (existingChat == null) {
      SocketManager().sendMessage(
        "start-chat",
        params,
        (data) async {
          if (data['status'] != 200) {
            Navigator.of(context).pop();
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "Could not create",
                  ),
                  content: Text(
                    "Reason: (${data["error"]["type"]}) -> ${data["error"]["message"]}",
                  ),
                  actions: [
                    TextButton(
                      child: Text(
                        "Ok",
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              }
            );
            completer.complete(null);
            return;
          }

          // If everything went well, let's add the chat to the bloc
          Chat newChat = Chat.fromMap(data["data"]);
          await returnChat(newChat);
        },
      );
    }

    if (existingChat != null) {
      await returnChat(existingChat);
    }

    return completer.future;
  }

  void onSelected(UniqueContact item) async {
    if (item.isChat) {
      if (widget.type == ChatSelectorTypes.ONLY_EXISTING) {
        selected.add(item);
        chat = item.chat;
        contacts = [];
      } else {
        for (Handle e in item?.chat?.participants ?? []) {
          UniqueContact contact = new UniqueContact(
              address: e.address,
              displayName: ContactManager()
                      .getCachedContactSync(e.address)
                      ?.displayName ??
                  await formatPhoneNumber(e.address));
          selected.add(contact);
        }

        await fetchCurrentChat();
      }

      resetCursor();
      if (this.mounted) setState(() {});
      return;
    }
    // Add the selected item
    selected.add(item);
    fetchCurrentChat();

    // Reset the controller text
    resetCursor();
    if (this.mounted) setState(() {});
  }

  Widget buildChatSelectorBody() => ListView.builder(
        physics: ThemeSwitcher.getScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => ContactSelectorOption(
          key: new Key("selector-${contacts[index].displayName}"),
          item: contacts[index],
          onSelected: onSelected,
        ),
        itemCount: contacts.length,
      );

  Widget buildChatSelectorHeader() => PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.5),
          middle: Container(
            child: Text(
              widget.customHeading ?? "New Message",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          leading: Container(),
        ),
      );
}

class UniqueContact {
  final String displayName;
  final String label;
  final String address;
  final Chat chat;

  bool get isChat => chat != null;

  UniqueContact({this.displayName, this.label, this.address, this.chat});
}

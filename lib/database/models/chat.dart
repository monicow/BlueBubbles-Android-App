import 'dart:convert';
import 'package:bluebubbles/action_handler.dart';
import 'package:bluebubbles/blocs/chat_bloc.dart';
import 'package:bluebubbles/database/repository/moor_database.dart';
import 'package:bluebubbles/helpers/message_helper.dart';
import 'package:bluebubbles/managers/notification_manager.dart';
import 'package:bluebubbles/database/models/attachment.dart';
import 'package:bluebubbles/database/repository/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:moor/moor.dart';
import 'package:sqflite/sqflite.dart';

import 'handle.dart';
import 'message.dart';
import '../../helpers/utils.dart';

Chat chatFromJson(String str) {
  final jsonData = json.decode(str);
  return Chat.fromMap(jsonData);
}

Future<String> getFullChatTitle(Chat _chat) async {
  String title = "";
  if (_chat.displayName == null || _chat.displayName == "") {
    Chat chat = await _chat.getParticipants();

    // If there are no participants, try to get them from the server
    if (chat.participants.length == 0) {
      await ActionHandler.handleChat(chat: chat);
      chat = await chat.getParticipants();
    }

    List<String> titles = [];
    for (int i = 0; i < chat.participants.length; i++) {
      String name = getContactTitle(chat.participants[i].address);

      if (chat.participants.length > 1 && !name.startsWith('+1')) {
        name = name.trim().split(" ")[0];
      } else {
        name = name.trim();
      }

      titles.add(name);
    }

    if (titles.length == 0) {
      title = _chat.chatIdentifier;
    } else if (titles.length == 1) {
      title = titles[0];
    } else if (titles.length <= 4) {
      title = titles.join(", ");
      int pos = title.lastIndexOf(", ");
      if (pos != -1)
        title = "${title.substring(0, pos)} & ${title.substring(pos + 2)}";
    } else {
      title = titles.sublist(0, 3).join(", ");
      title = "$title & ${titles.length - 3} others";
    }
  } else {
    title = _chat.displayName;
  }

  return title;
}

String getShortChatTitle(Chat _chat) {
  if (_chat.participants.length == 1) {
    return getContactTitle(_chat.participants[0].address);
  } else if (_chat.displayName != null && _chat.displayName.length != 0) {
    return _chat.displayName;
  } else {
    return "${_chat.participants.length} people";
  }
}

class Chat {
  /// Column values
  /// Modify when you update the [ChatTable] in repository/moor_database.dart
  int id;
  String guid;
  int style;
  String chatIdentifier;
  bool isArchived;
  bool isMuted;
  bool hasUnreadMessage;
  DateTime latestMessageDate;
  String latestMessageText;
  String displayName;

  /// Local values, these are not related to the [ChatTable]
  /// @param title The title that is created from the participants and displayname
  /// @param participants
  String title;
  List<Handle> participants;

  Chat({
    this.id,
    this.guid,
    this.style,
    this.chatIdentifier,
    this.isArchived,
    this.isMuted,
    this.hasUnreadMessage,
    this.displayName,
    this.participants,
    this.latestMessageDate,
    this.latestMessageText,
  });

  /// Used to receive json data from server
  ///
  /// Returns a chat model created from the json
  ///
  /// Does NOT save to the db automatically, simply creates a [ChatEntity] from the json
  /// and converts to this map
  ///
  ///
  /// @param json The map of json data
  factory Chat.fromMap(Map<String, dynamic> json) {
    List<Handle> participants = [];
    if (json.containsKey('participants')) {
      (json['participants'] as List<dynamic>).forEach((item) {
        participants.add(Handle.fromMap(item));
      });
    }

    return Chat.fromEntity(ChatEntity.fromJson(json))
      ..participants = participants;
  }

  /// Converts a [ChatEntity] to a [Chat] model. Returns a [Chat]
  ///
  /// Most often used when retreiving data from the db
  ///
  /// @param entity The chat entity to convert into this model
  ///
  /// @param participants OPTIONAL: The participants to attach to this model
  factory Chat.fromEntity(ChatEntity entity,
      {List<HandleEntity> participants}) {
    return new Chat(
      id: entity.id,
      guid: entity.guid,
      style: entity.style,
      chatIdentifier: entity.chatIdentifier,
      isArchived: entity.isArchived,
      isMuted: entity.isMuted,
      hasUnreadMessage: entity.hasUnreadMessage,
      displayName: entity.displayName,
      latestMessageDate: entity.latestMessageDate,
      latestMessageText: entity.latestMessageText,
    );
  }

  Future<Chat> save(
      {bool updateIfAbsent = true, bool updateLocalVals = false}) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // Try to find an existing chat before saving it
    Chat existing = await Chat.findOne({"guid": this.guid});
    if (existing != null) {
      this.id = existing.id;
      if (!updateLocalVals) {
        this.isMuted = existing.isMuted;
        this.isArchived = existing.isArchived;
        this.hasUnreadMessage = existing.hasUnreadMessage;
      }
    }

    // If it already exists, update it
    if (existing == null) {
      // Remove the ID from the map for inserting
      this.id = null;

      this.id = await db.chatDao.insertEntry(this.toEntity());
    } else if (updateIfAbsent) {
      await this.update();
    }

    // Save participants to the chat
    for (int i = 0; i < this.participants.length; i++) {
      await this.addParticipant(this.participants[i]);
    }

    return this;
  }

  Future<Chat> changeName(String name) async {
    final AppDatabase db = await DBProvider.db.appDatabase;
    if (this.id == null) await this.save();
    ChatTableCompanion companion = new ChatTableCompanion(
      displayName: Value(name),
    );

    await db.chatDao.updateEntry(companion);
    this.displayName = name;
    return this;
  }

  Future<String> getTitle() async {
    this.title = await getFullChatTitle(this);
    return this.title;
  }

  String getDateText() {
    if (this.latestMessageDate == null ||
        this.latestMessageDate.millisecondsSinceEpoch == 0) return "";
    if (this.latestMessageDate.isToday()) {
      return new DateFormat.jm().format(this.latestMessageDate);
    } else if (this.latestMessageDate.isYesterday()) {
      return "Yesterday";
    } else {
      return "${this.latestMessageDate.month.toString()}/${this.latestMessageDate.day.toString()}/${this.latestMessageDate.year.toString()}";
    }
  }

  Future<Chat> update() async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // Map<String, dynamic> params = {
    //   "isArchived": this.isArchived ? 1 : 0,
    //   "isMuted": this.isMuted ? 1 : 0,
    // };

    /// We need to create a new companion, that way we can only set the values of
    /// [isArchived], [isMuted], [latestMessageText], [latestMessageDate], and [displayName]
    /// to their respective values
    ///
    ///[display] name is set even if it is null
    ChatTableCompanion companion = ChatTableCompanion(
      displayName: Value(this.displayName),
      isMuted: this.isMuted != null ? Value(this.isMuted) : Value.absent(),
      isArchived:
          this.isArchived != null ? Value(this.isArchived) : Value.absent(),
      latestMessageDate: this.latestMessageDate != null
          ? Value(this.latestMessageDate)
          : Value.absent(),
      latestMessageText: this.latestMessageText != null
          ? Value(this.latestMessageText)
          : Value.absent(),
    );

    // If it already exists, update it
    if (this.id != null) {
      await db.chatDao.updateEntry(companion);
    } else {
      await this.save(updateIfAbsent: false);
    }

    return this;
  }

  Future<Chat> setUnreadStatus(bool hasUnreadMessage) async {
    final AppDatabase db = await DBProvider.db.appDatabase;
    if (hasUnreadMessage) {
      if (NotificationManager().chatGuid == this.guid) {
        return this;
      }
    }
    this.hasUnreadMessage = hasUnreadMessage;
    ChatTableCompanion companion = new ChatTableCompanion(
      hasUnreadMessage: this.hasUnreadMessage != null
          ? Value(this.hasUnreadMessage)
          : Value.absent(),
    );

    // If it already exists, update it
    if (this.id != null) {
      await db.chatDao.updateEntry(companion);
    } else {
      await this.save(updateIfAbsent: false);
    }

    return this;
  }

  Future<Chat> addMessage(Message message,
      {bool changeUnreadStatus: true}) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // Save the message
    Message newMessage = await message.save();
    bool isNewer = false;

    // If the message was saved correctly, update this chat's latestMessage info,
    // but only if the incoming message's date is newer
    if (newMessage.id != null &&
        (this.latestMessageDate == null ||
            this.latestMessageDate.millisecondsSinceEpoch <
                message.dateCreated.millisecondsSinceEpoch)) {
      this.latestMessageText = MessageHelper.getNotificationText(message);
      this.latestMessageDate = message.dateCreated;
      isNewer = true;
    }

    // Save the chat.
    // This will update the latestMessage info as well as update some
    // other fields that we want to "mimic" from the server
    await this.save();

    // Check join table and add if relationship doesn't exist
    List entries =
        await db.cMJDao.find({"chatId": this.id, "messageId": message.id});

    // If the relationship doesn't exist, add it
    if (entries.length == 0) {
      await db.cMJDao.insertEntry(this.id, message.id);
    }

    // If the incoming message was newer than the "last" one, set the unread status accordingly
    if (changeUnreadStatus && isNewer) {
      // If the message is from me, mark it unread
      // If the message is not from the same chat as the current chat, mark unread
      if (message.isFromMe) {
        await this.setUnreadStatus(false);
      } else if (NotificationManager().chatGuid != this.guid) {
        await this.setUnreadStatus(true);
      }
    }

    // Update the chat position
    await ChatBloc().updateChatPosition(this);

    // Return the current chat instance (with updated vals)
    return this;
  }

  static Future<List<Attachment>> getAttachments(Chat chat,
      {int offset = 0, int limit = 25}) async {
    final Database db = await DBProvider.db.database;
    if (chat.id == null) return [];

    String query = ("SELECT"
        " attachment.ROWID AS ROWID,"
        " attachment.guid AS guid,"
        " attachment.uti AS uti,"
        " attachment.mimeType AS mimeType,"
        " attachment.totalBytes AS totalBytes,"
        " attachment.transferName AS transferName,"
        " attachment.blurhash AS blurhash"
        " FROM attachment"
        " JOIN attachment_message_join AS amj ON amj.attachmentId = attachment.ROWID"
        " JOIN message ON amj.messageId = message.ROWID"
        " JOIN chat_message_join AS cmj ON cmj.messageId = message.ROWID"
        " JOIN chat ON chat.ROWID = cmj.chatId"
        " WHERE chat.ROWID = ? AND attachment.mimeType IS NOT NULL");

    // Add pagination
    query += " ORDER BY message.dateCreated DESC LIMIT $limit OFFSET $offset";

    // Execute the query
    var res = await db.rawQuery("$query;", [chat.id]);
    return res == null
        ? []
        : res.map((attachment) => Attachment.fromMap(attachment)).toList();
  }

  static Future<List<Message>> getMessages(Chat chat,
      {bool reactionsOnly = false, int offset = 0, int limit = 25}) async {
    final Database db = await DBProvider.db.database;
    if (chat.id == null) return [];

    // String reactionQualifier = reactionsOnly ? "IS NOT" : "IS";
    String query = ("SELECT"
        " message.ROWID AS ROWID,"
        " message.originalROWID AS originalROWID,"
        " message.guid AS guid,"
        " message.handleId AS handleId,"
        " message.text AS text,"
        " message.subject AS subject,"
        " message.country AS country,"
        " message.error AS error,"
        " message.dateCreated AS dateCreated,"
        " message.dateDelivered AS dateDelivered,"
        " message.dateRead AS dateRead,"
        " message.isFromMe AS isFromMe,"
        " message.isDelayed AS isDelayed,"
        " message.isAutoReply AS isAutoReply,"
        " message.isSystemMessage AS isSystemMessage,"
        " message.isForward AS isForward,"
        " message.isArchived AS isArchived,"
        " message.cacheRoomnames AS cacheRoomnames,"
        " message.isAudioMessage AS isAudioMessage,"
        " message.datePlayed AS datePlayed,"
        " message.itemType AS itemType,"
        " message.groupTitle AS groupTitle,"
        " message.groupActionType AS groupActionType,"
        " message.isExpired AS isExpired,"
        " message.associatedMessageGuid AS associatedMessageGuid,"
        " message.associatedMessageType AS associatedMessageType,"
        " message.expressiveSendStyleId AS texexpressiveSendStyleIdt,"
        " message.timeExpressiveSendStyleId AS timeExpressiveSendStyleId,"
        " message.hasAttachments AS hasAttachments,"
        " message.hasReactions AS hasReactions,"
        " handle.ROWID AS handleId,"
        " handle.address AS handleAddress,"
        " handle.country AS handleCountry,"
        " handle.uncanonicalizedId AS handleUncanonicalizedId"
        " FROM message"
        " JOIN chat_message_join AS cmj ON message.ROWID = cmj.messageId"
        " JOIN chat ON cmj.chatId = chat.ROWID"
        " LEFT OUTER JOIN handle ON handle.ROWID = message.handleId"
        " WHERE chat.ROWID = ?");

    // Add pagination
    String pagination =
        " ORDER BY message.originalROWID DESC LIMIT $limit OFFSET $offset;";

    // Execute the query
    var res = await db.rawQuery(
        "$query" +
            " AND message.originalROWID IS NOT NULL GROUP BY message.ROWID" +
            pagination,
        [chat.id]);

    // Add the from/handle data to the messages
    List<Message> output = [];
    for (int i = 0; i < res.length; i++) {
      Message msg = Message.fromMap(res[i]);

      // If the handle is not null, load the handle data
      // The handle is null if the message.handleId is 0
      // the handleId is 0 when isFromMe is true and the chat is a group chat
      if (res[i].containsKey('handleAddress') &&
          res[i]['handleAddress'] != null) {
        msg.handle = Handle.fromMap({
          'id': res[i]['handleId'],
          'address': res[i]['handleAddress'],
          'country': res[i]['handleCountry'],
          'uncanonicalizedId': res[i]['handleUncanonicalizedId']
        });
      }

      output.add(msg);
    }

    var res2 = await db.rawQuery(
        "$query" + " AND message.originalROWID IS NULL GROUP BY message.ROWID;",
        [chat.id]);
    for (int i = 0; i < res2.length; i++) {
      Message msg = Message.fromMap(res2[i]);

      // If the handle is not null, load the handle data
      // The handle is null if the message.handleId is 0
      // the handleId is 0 when isFromMe is true and the chat is a group chat
      if (res2[i].containsKey('handleAddress') &&
          res2[i]['handleAddress'] != null) {
        msg.handle = Handle.fromMap({
          'id': res2[i]['handleId'],
          'address': res2[i]['handleAddress'],
          'country': res2[i]['handleCountry'],
          'uncanonicalizedId': res2[i]['handleUncanonicalizedId']
        });
      }
      for (int j = 0; j < output.length; j++) {
        if (output[j].id < msg.id) {
          output.insert(j, msg);
          break;
        }
      }
    }

    return output;
  }

  Future<Chat> getParticipants() async {
    final Database db = await DBProvider.db.database;

    var res = await db.rawQuery(
        "SELECT"
        " handle.ROWID AS ROWID,"
        " handle.address AS address,"
        " handle.country AS country,"
        " handle.uncanonicalizedId AS uncanonicalizedId"
        " FROM chat"
        " JOIN chat_handle_join AS chj ON chat.ROWID = chj.chatId"
        " JOIN handle ON handle.ROWID = chj.handleId"
        " WHERE chat.ROWID = ?;",
        [this.id]);

    this.participants =
        (res.isNotEmpty) ? res.map((c) => Handle.fromMap(c)).toList() : [];
    return this;
  }

  Future<Chat> addParticipant(Handle participant) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // Save participant and add to list
    await participant.save();
    if (!this.participants.contains(participant)) {
      this.participants.add(participant);
    }

    // Check join table and add if relationship doesn't exist
    List<ChatHandleJoinData> entries = await db.cHJDao.find({"chatId": this.id, "handleId": participant.id});
    if (entries.length == 0) {
      await db.cHJDao.insertEntry( this.id, participant.id);
    }

    return this;
  }

  Future<Chat> removeParticipant(Handle participant) async {
    final Database db = await DBProvider.db.database;

    // First, remove from the JOIN table
    await db.delete("chat_handle_join",
        where: "chatId = ? AND handleId = ?",
        whereArgs: [this.id, participant.id]);

    // Second, remove from this object instance
    if (this.participants.contains(participant)) {
      this.participants.remove(participant);
    }

    return this;
  }

  static Future<Chat> findOne(Map<String, dynamic> filters) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<ChatEntity> res = await db.chatDao.find(filters, findOne: true);
    return !res.isEmpty ? Chat.fromEntity(res.first) : null;
  }

  static Future<List<Chat>> find(
      [Map<String, dynamic> filters = const {}, limit, offset]) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    var res = await db.chatDao.find(filters, limit: limit, offset: offset);
    return (res.isNotEmpty) ? res.map((c) => Chat.fromEntity(c)).toList() : [];
  }

  static Future<List<Chat>> getChats(
      {bool archived = false, int limit = 15, int offset = 0}) async {
    final AppDatabase db = await DBProvider.db.appDatabase;
    var query = db.select(db.chatTable)
      ..where((tbl) => tbl.isArchived.equals(archived))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.latestMessageDate)])
      ..limit(limit, offset: offset);
    var res = await query.get();

    return (res.isNotEmpty) ? res.map((c) => Chat.fromEntity(c)).toList() : [];
  }

  static flush() async {
    final Database db = await DBProvider.db.database;
    await db.delete("chat");
  }

  ChatEntity toEntity() => ChatEntity(
        id: this.id,
        guid: this.guid,
        style: this.style,
        chatIdentifier: this.chatIdentifier,
        isArchived: this.isArchived,
        isMuted: this.isMuted,
        hasUnreadMessage: this.hasUnreadMessage,
        latestMessageDate: this.latestMessageDate,
        latestMessageText: this.latestMessageText,
        displayName: this.displayName,
      );
}

import 'dart:convert';
import 'package:bluebubbles/database/repository/moor_database.dart';
import 'package:bluebubbles/managers/new_message_manager.dart';
import 'package:bluebubbles/database/models/attachment.dart';
import 'package:bluebubbles/database/repository/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:moor/moor.dart';
import 'package:sqflite/sqflite.dart';

import 'chat.dart';
import 'handle.dart';
import '../../helpers/utils.dart';

class Message {
  int id;
  int originalROWID;
  String guid;
  int handleId;
  String text;
  String subject;
  String country;
  int error;
  DateTime dateCreated;
  DateTime dateRead;
  DateTime dateDelivered;
  bool isFromMe;
  bool isDelayed;
  bool isAutoReply;
  bool isSystemMessage;
  bool isServiceMessage;
  bool isForward;
  bool isArchived;
  String cacheRoomnames;
  bool isAudioMessage;
  DateTime datePlayed;
  int itemType;
  String groupTitle;
  int groupActionType;
  bool isExpired;
  String associatedMessageGuid;
  String associatedMessageType;
  String expressiveSendStyleId;
  int timeExpressiveSendStyleId;
  Handle handle;
  bool hasAttachments;
  bool hasReactions;

  List<Attachment> attachments;

  Message({
    this.id,
    this.originalROWID,
    this.guid,
    this.handleId,
    this.text,
    this.subject,
    this.country,
    this.error = 0,
    this.dateCreated,
    this.dateRead,
    this.dateDelivered,
    this.isFromMe = true,
    this.isDelayed = false,
    this.isAutoReply = false,
    this.isSystemMessage = false,
    this.isServiceMessage = false,
    this.isForward = false,
    this.isArchived = false,
    this.cacheRoomnames,
    this.isAudioMessage = false,
    this.datePlayed,
    this.itemType = 0,
    this.groupTitle,
    this.groupActionType = 0,
    this.isExpired = false,
    this.associatedMessageGuid,
    this.associatedMessageType,
    this.expressiveSendStyleId,
    this.timeExpressiveSendStyleId,
    this.handle,
    this.hasAttachments = false,
    this.hasReactions = false,
    this.attachments,
  });

  factory Message.fromMap(Map<String, dynamic> json) {
    bool hasAttachments = false;
    if (json.containsKey("hasAttachments")) {
      hasAttachments = json["hasAttachments"] == 1 ? true : false;
    } else if (json.containsKey("attachments")) {
      hasAttachments = (json['attachments'] as List).length > 0 ? true : false;
    }

    List<Attachment> attachments = json.containsKey("attachments")
        ? (json['attachments'] as List)
            .map((a) => Attachment.fromMap(a))
            .toList()
        : [];

    return Message.fromEntity(
        MessageEntity.fromJson(json).copyWith(hasAttachments: hasAttachments),
        handle: json.containsKey('handle') && json['handle'] != null
            ? Handle.fromMap(json['handle'])
            : null)
      ..attachments = attachments;
  }

  factory Message.fromEntity(MessageEntity entity, {Handle handle}) {
    String associatedMessageGuid = entity.associatedMessageGuid;
    if (associatedMessageGuid != null) {
      if (associatedMessageGuid.contains("/")) {
        associatedMessageGuid = associatedMessageGuid.split("/").last;
      } else {
        associatedMessageGuid = associatedMessageGuid.split(":").last;
      }
    }
    return new Message(
      id: entity.id,
      originalROWID: entity.originalROWID,
      guid: entity.guid,
      handleId: entity.handleId,
      text: sanitizeString(entity.contentText),
      subject: entity.subject,
      country: entity.country,
      error: entity.error,
      dateCreated: entity.dateCreated,
      dateRead: entity.dateRead,
      dateDelivered: entity.dateDelivered,
      isFromMe: entity.isFromMe,
      isDelayed: entity.isDelayed,
      isAutoReply: entity.isAutoReply,
      isSystemMessage: entity.isSystemMessage,
      isForward: entity.isForward,
      isArchived: entity.isArchived,
      isServiceMessage: entity.isServiceMessage,
      cacheRoomnames: entity.cacheRoomnames,
      isAudioMessage: entity.isAudioMessage,
      datePlayed: entity.datePlayed,
      itemType: entity.itemType,
      groupTitle: entity.groupTitle,
      groupActionType: entity.groupActionType,
      isExpired: entity.isExpired,
      associatedMessageGuid: associatedMessageGuid,
      associatedMessageType: entity.associatedMessageType,
      expressiveSendStyleId: entity.expressiveSendStyleId,
      timeExpressiveSendStyleId: entity.timeExpressiveSendStyleId,
      handle: handle,
      hasAttachments: entity.hasAttachments,
      hasReactions: entity.hasReactions,
    );
  }

  Future<Message> save([bool updateIfAbsent = true]) async {
    final AppDatabase db = await DBProvider.db.appDatabase;
    // Try to find an existing chat before saving it
    Message existing = await Message.findOne({"guid": this.guid});
    if (existing != null) {
      this.id = existing.id;
    }

    // Save the participant & set the handle ID to the new participant
    if (this.handle != null) {
      await this.handle.save();
      this.handleId = this.handle.id;
    }
    if (this.associatedMessageType != null &&
        this.associatedMessageGuid != null) {
      Message associatedMessage =
          await Message.findOne({"guid": this.associatedMessageGuid});
      if (associatedMessage != null) {
        associatedMessage.hasReactions = true;
        await associatedMessage.save();
      }
    } else if (this.hasReactions == null || !this.hasReactions) {
      Message reaction =
          await Message.findOne({"associatedMessageGuid": this.guid});
      if (reaction != null) {
        this.hasReactions = true;
      }
    }

    // If it already exists, update it
    if (existing == null) {
      // Remove the ID from the map for inserting
      if (this.handleId == null) this.handleId = 0;
      MessageEntity entity = this.toEntity().copyWith(id: null);

      this.id = await db.messageDao.insertEntry(entity);
    } else if (updateIfAbsent) {
      await this.update();
    }

    return this;
  }

  static Future<Message> replaceMessage(String oldGuid, Message newMessage,
      {bool awaitNewMessageEvent = true, Chat chat}) async {
    final AppDatabase db = await DBProvider.db.appDatabase;
    Message existing = await Message.findOne({"guid": oldGuid});
    if (existing == null) {
      if (awaitNewMessageEvent) {
        await Future.delayed(Duration(milliseconds: 500));
        return replaceMessage(
          oldGuid,
          newMessage,
          awaitNewMessageEvent: false,
          chat: chat,
        );
      } else {
        if (chat != null) {
          await newMessage.save();
          await chat.save();
          await chat.addMessage(newMessage);
          NewMessageManager().addMessage(chat, newMessage, outgoing: false);
          return newMessage;
        }
      }
    }

    newMessage.id = existing.id;
    newMessage.handleId = existing.handleId;
    newMessage.hasAttachments = existing.hasAttachments;
    newMessage.hasReactions = existing.hasReactions;
    MessageEntity params = newMessage.toEntity();

    await db.messageDao.updateEntry(params.toCompanion(true));
    return newMessage;
  }

  Future<Message> update() async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    MessageTableCompanion companion = MessageTableCompanion(
      dateCreated:
          this.dateCreated != null ? Value(this.dateCreated) : Value.absent(),
      dateRead: this.dateRead != null ? Value(this.dateRead) : Value.absent(),
      dateDelivered: this.dateDelivered != null
          ? Value(this.dateDelivered)
          : Value.absent(),
      isArchived:
          this.isArchived != null ? Value(this.isArchived) : Value.absent(),
      datePlayed:
          this.datePlayed != null ? Value(this.datePlayed) : Value.absent(),
      error: this.error != null ? Value(this.error) : Value.absent(),
      hasReactions:
          this.hasReactions != null ? Value(this.hasReactions) : Value.absent(),
    );

    // If it already exists, update it
    if (this.id != null) {
      await db.messageDao.updateEntry(companion);
    } else {
      await this.save(false);
    }

    return this;
  }

  static Future<List<Attachment>> getAttachments(Message message) async {
    if (message.hasAttachments &&
        message.attachments != null &&
        message.attachments.length != 0) {
      return message.attachments ?? [];
    }

    final Database db = await DBProvider.db.database;
    if (message.id == null) return [];

    var res = await db.rawQuery(
        "SELECT"
        " attachment.ROWID AS ROWID,"
        " attachment.guid AS guid,"
        " attachment.uti AS uti,"
        " attachment.mimeType AS mimeType,"
        " attachment.transferState AS transferState,"
        " attachment.isOutgoing AS isOutgoing,"
        " attachment.transferName AS transferName,"
        " attachment.totalBytes AS totalBytes,"
        " attachment.isSticker AS isSticker,"
        " attachment.hideAttachment AS hideAttachment,"
        " attachment.blurhash AS blurhash,"
        " attachment.width AS width,"
        " attachment.height AS height"
        " FROM message"
        " JOIN attachment_message_join AS amj ON message.ROWID = amj.messageId"
        " JOIN attachment ON attachment.ROWID = amj.attachmentId"
        " WHERE message.ROWID = ?;",
        [message.id]);

    message.attachments =
        (res.isNotEmpty) ? res.map((c) => Attachment.fromMap(c)).toList() : [];

    return message.attachments;
  }

  static Future<Chat> getChat(Message message) async {
    final Database db = await DBProvider.db.database;

    var res = await db.rawQuery(
        "SELECT"
        " chat.ROWID AS ROWID,"
        " chat.guid AS guid,"
        " chat.style AS style,"
        " chat.chatIdentifier AS chatIdentifier,"
        " chat.isArchived AS isArchived,"
        " chat.displayName AS displayName"
        " FROM chat"
        " JOIN chat_message_join AS cmj ON chat.ROWID = cmj.chatId"
        " JOIN message ON message.ROWID = cmj.messageId"
        " WHERE message.ROWID = ?;",
        [message.id]);

    return (res.isNotEmpty) ? Chat.fromMap(res[0]) : null;
  }

  Future<List<Message>> getReactions() async {
    List<Message> res =
        await Message.find({"associatedMessageGuid": this.guid});
    return res;
  }

  Future<Handle> getHandle() async {
    final Database db = await DBProvider.db.database;

    var res = await db.rawQuery(
        "SELECT"
        " handle.ROWID AS ROWID,"
        " handle.address AS address,"
        " handle.country AS country,"
        " handle.uncanonicalizedId AS uncanonicalizedId"
        " FROM handle"
        " JOIN message ON message.handleId = handle.ROWID"
        " WHERE message.ROWID = ?;",
        [this.id]);

    this.handle =
        (res.isNotEmpty) ? res.map((c) => Handle.fromMap(c)).toList()[0] : null;
    return this.handle;
  }

  static Future<Message> findOne(Map<String, dynamic> filters) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<MessageEntity> res = await db.messageDao.find(filters, findOne: true);

    if (res.isEmpty) {
      return null;
    }

    return Message.fromEntity(res.first);
  }

  static Future<List<Message>> find(
      [Map<String, dynamic> filters = const {}]) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<MessageEntity> res = await db.messageDao.find(filters);
    return (res.isNotEmpty)
        ? res.map((c) => Message.fromEntity(c)).toList()
        : [];
  }

  static Future<void> delete(Map<String, dynamic> where) async {
    final Database db = await DBProvider.db.database;

    List<String> whereParams = [];
    where.keys.forEach((filter) => whereParams.add('$filter = ?'));
    List<dynamic> whereArgs = [];
    where.values.forEach((filter) => whereArgs.add(filter));

    List<Message> toDelete = await Message.find(where);
    for (Message msg in toDelete) {
      await db.delete("chat_message_join",
          where: "messageId = ?", whereArgs: [msg.id]);
      await db.delete("message", where: "ROWID = ?", whereArgs: [msg.id]);
    }
  }

  static flush() async {
    final Database db = await DBProvider.db.database;
    await db.delete("message");
  }

  MessageEntity toEntity() => MessageEntity(
        id: this.id,
        originalROWID: this.originalROWID,
        guid: this.guid,
        handleId: this.handleId,
        contentText: sanitizeString(this.text),
        subject: this.subject,
        country: this.country,
        error: this.error,
        dateCreated: this.dateCreated,
        dateRead: this.dateRead,
        dateDelivered: this.dateDelivered,
        isFromMe: this.isFromMe,
        isDelayed: this.isDelayed,
        isAutoReply: this.isAutoReply,
        isSystemMessage: this.isSystemMessage,
        isForward: this.isForward,
        isArchived: this.isArchived,
        isServiceMessage: this.isServiceMessage,
        cacheRoomnames: this.cacheRoomnames,
        isAudioMessage: this.isAudioMessage,
        datePlayed: this.datePlayed,
        itemType: this.itemType,
        groupTitle: this.groupTitle,
        groupActionType: this.groupActionType,
        isExpired: this.isExpired,
        associatedMessageGuid: associatedMessageGuid,
        associatedMessageType: this.associatedMessageType,
        expressiveSendStyleId: this.expressiveSendStyleId,
        timeExpressiveSendStyleId: this.timeExpressiveSendStyleId,
        hasAttachments: this.hasAttachments,
        hasReactions: this.hasReactions,
      );
}

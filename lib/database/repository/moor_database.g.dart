// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ChatHandleJoinData extends DataClass
    implements Insertable<ChatHandleJoinData> {
  final int id;
  final int chatId;
  final int handleId;
  ChatHandleJoinData({this.id, @required this.chatId, @required this.handleId});
  factory ChatHandleJoinData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ChatHandleJoinData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chatId: intType.mapFromDatabaseResponse(data['${effectivePrefix}chatId']),
      handleId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}handleId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || chatId != null) {
      map['chatId'] = Variable<int>(chatId);
    }
    if (!nullToAbsent || handleId != null) {
      map['handleId'] = Variable<int>(handleId);
    }
    return map;
  }

  ChatHandleJoinCompanion toCompanion(bool nullToAbsent) {
    return ChatHandleJoinCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chatId:
          chatId == null && nullToAbsent ? const Value.absent() : Value(chatId),
      handleId: handleId == null && nullToAbsent
          ? const Value.absent()
          : Value(handleId),
    );
  }

  factory ChatHandleJoinData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatHandleJoinData(
      id: serializer.fromJson<int>(json['id']),
      chatId: serializer.fromJson<int>(json['chatId']),
      handleId: serializer.fromJson<int>(json['handleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatId': serializer.toJson<int>(chatId),
      'handleId': serializer.toJson<int>(handleId),
    };
  }

  ChatHandleJoinData copyWith({int id, int chatId, int handleId}) =>
      ChatHandleJoinData(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        handleId: handleId ?? this.handleId,
      );
  @override
  String toString() {
    return (StringBuffer('ChatHandleJoinData(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('handleId: $handleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(chatId.hashCode, handleId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatHandleJoinData &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.handleId == this.handleId);
}

class ChatHandleJoinCompanion extends UpdateCompanion<ChatHandleJoinData> {
  final Value<int> id;
  final Value<int> chatId;
  final Value<int> handleId;
  const ChatHandleJoinCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.handleId = const Value.absent(),
  });
  ChatHandleJoinCompanion.insert({
    this.id = const Value.absent(),
    @required int chatId,
    @required int handleId,
  })  : chatId = Value(chatId),
        handleId = Value(handleId);
  static Insertable<ChatHandleJoinData> custom({
    Expression<int> id,
    Expression<int> chatId,
    Expression<int> handleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chatId': chatId,
      if (handleId != null) 'handleId': handleId,
    });
  }

  ChatHandleJoinCompanion copyWith(
      {Value<int> id, Value<int> chatId, Value<int> handleId}) {
    return ChatHandleJoinCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      handleId: handleId ?? this.handleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatId.present) {
      map['chatId'] = Variable<int>(chatId.value);
    }
    if (handleId.present) {
      map['handleId'] = Variable<int>(handleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatHandleJoinCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('handleId: $handleId')
          ..write(')'))
        .toString();
  }
}

class ChatHandleJoin extends Table
    with TableInfo<ChatHandleJoin, ChatHandleJoinData> {
  final GeneratedDatabase _db;
  final String _alias;
  ChatHandleJoin(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  }

  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  GeneratedIntColumn _chatId;
  GeneratedIntColumn get chatId => _chatId ??= _constructChatId();
  GeneratedIntColumn _constructChatId() {
    return GeneratedIntColumn('chatId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _handleIdMeta = const VerificationMeta('handleId');
  GeneratedIntColumn _handleId;
  GeneratedIntColumn get handleId => _handleId ??= _constructHandleId();
  GeneratedIntColumn _constructHandleId() {
    return GeneratedIntColumn('handleId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [id, chatId, handleId];
  @override
  ChatHandleJoin get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chat_handle_join';
  @override
  final String actualTableName = 'chat_handle_join';
  @override
  VerificationContext validateIntegrity(Insertable<ChatHandleJoinData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('chatId')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chatId'], _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('handleId')) {
      context.handle(_handleIdMeta,
          handleId.isAcceptableOrUnknown(data['handleId'], _handleIdMeta));
    } else if (isInserting) {
      context.missing(_handleIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatHandleJoinData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChatHandleJoinData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  ChatHandleJoin createAlias(String alias) {
    return ChatHandleJoin(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY(chatId) REFERENCES chat(id)',
        'FOREIGN KEY(handleId) REFERENCES handle(id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class ChatMessageJoinData extends DataClass
    implements Insertable<ChatMessageJoinData> {
  final int id;
  final int chatId;
  final int messageId;
  ChatMessageJoinData(
      {this.id, @required this.chatId, @required this.messageId});
  factory ChatMessageJoinData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ChatMessageJoinData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      chatId: intType.mapFromDatabaseResponse(data['${effectivePrefix}chatId']),
      messageId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}messageId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || chatId != null) {
      map['chatId'] = Variable<int>(chatId);
    }
    if (!nullToAbsent || messageId != null) {
      map['messageId'] = Variable<int>(messageId);
    }
    return map;
  }

  ChatMessageJoinCompanion toCompanion(bool nullToAbsent) {
    return ChatMessageJoinCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      chatId:
          chatId == null && nullToAbsent ? const Value.absent() : Value(chatId),
      messageId: messageId == null && nullToAbsent
          ? const Value.absent()
          : Value(messageId),
    );
  }

  factory ChatMessageJoinData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatMessageJoinData(
      id: serializer.fromJson<int>(json['id']),
      chatId: serializer.fromJson<int>(json['chatId']),
      messageId: serializer.fromJson<int>(json['messageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chatId': serializer.toJson<int>(chatId),
      'messageId': serializer.toJson<int>(messageId),
    };
  }

  ChatMessageJoinData copyWith({int id, int chatId, int messageId}) =>
      ChatMessageJoinData(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );
  @override
  String toString() {
    return (StringBuffer('ChatMessageJoinData(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(chatId.hashCode, messageId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatMessageJoinData &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.messageId == this.messageId);
}

class ChatMessageJoinCompanion extends UpdateCompanion<ChatMessageJoinData> {
  final Value<int> id;
  final Value<int> chatId;
  final Value<int> messageId;
  const ChatMessageJoinCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.messageId = const Value.absent(),
  });
  ChatMessageJoinCompanion.insert({
    this.id = const Value.absent(),
    @required int chatId,
    @required int messageId,
  })  : chatId = Value(chatId),
        messageId = Value(messageId);
  static Insertable<ChatMessageJoinData> custom({
    Expression<int> id,
    Expression<int> chatId,
    Expression<int> messageId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chatId': chatId,
      if (messageId != null) 'messageId': messageId,
    });
  }

  ChatMessageJoinCompanion copyWith(
      {Value<int> id, Value<int> chatId, Value<int> messageId}) {
    return ChatMessageJoinCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chatId.present) {
      map['chatId'] = Variable<int>(chatId.value);
    }
    if (messageId.present) {
      map['messageId'] = Variable<int>(messageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatMessageJoinCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }
}

class ChatMessageJoin extends Table
    with TableInfo<ChatMessageJoin, ChatMessageJoinData> {
  final GeneratedDatabase _db;
  final String _alias;
  ChatMessageJoin(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  }

  final VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  GeneratedIntColumn _chatId;
  GeneratedIntColumn get chatId => _chatId ??= _constructChatId();
  GeneratedIntColumn _constructChatId() {
    return GeneratedIntColumn('chatId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _messageIdMeta = const VerificationMeta('messageId');
  GeneratedIntColumn _messageId;
  GeneratedIntColumn get messageId => _messageId ??= _constructMessageId();
  GeneratedIntColumn _constructMessageId() {
    return GeneratedIntColumn('messageId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [id, chatId, messageId];
  @override
  ChatMessageJoin get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chat_message_join';
  @override
  final String actualTableName = 'chat_message_join';
  @override
  VerificationContext validateIntegrity(
      Insertable<ChatMessageJoinData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('chatId')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chatId'], _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('messageId')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['messageId'], _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatMessageJoinData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChatMessageJoinData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  ChatMessageJoin createAlias(String alias) {
    return ChatMessageJoin(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY(chatId) REFERENCES chat(id)',
        'FOREIGN KEY(messageId) REFERENCES message(id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class AttachmentMessageJoinData extends DataClass
    implements Insertable<AttachmentMessageJoinData> {
  final int id;
  final int attachmentId;
  final int messageId;
  AttachmentMessageJoinData(
      {this.id, @required this.attachmentId, @required this.messageId});
  factory AttachmentMessageJoinData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return AttachmentMessageJoinData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      attachmentId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachmentId']),
      messageId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}messageId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || attachmentId != null) {
      map['attachmentId'] = Variable<int>(attachmentId);
    }
    if (!nullToAbsent || messageId != null) {
      map['messageId'] = Variable<int>(messageId);
    }
    return map;
  }

  AttachmentMessageJoinCompanion toCompanion(bool nullToAbsent) {
    return AttachmentMessageJoinCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      attachmentId: attachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentId),
      messageId: messageId == null && nullToAbsent
          ? const Value.absent()
          : Value(messageId),
    );
  }

  factory AttachmentMessageJoinData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AttachmentMessageJoinData(
      id: serializer.fromJson<int>(json['id']),
      attachmentId: serializer.fromJson<int>(json['attachmentId']),
      messageId: serializer.fromJson<int>(json['messageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'attachmentId': serializer.toJson<int>(attachmentId),
      'messageId': serializer.toJson<int>(messageId),
    };
  }

  AttachmentMessageJoinData copyWith(
          {int id, int attachmentId, int messageId}) =>
      AttachmentMessageJoinData(
        id: id ?? this.id,
        attachmentId: attachmentId ?? this.attachmentId,
        messageId: messageId ?? this.messageId,
      );
  @override
  String toString() {
    return (StringBuffer('AttachmentMessageJoinData(')
          ..write('id: $id, ')
          ..write('attachmentId: $attachmentId, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(attachmentId.hashCode, messageId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AttachmentMessageJoinData &&
          other.id == this.id &&
          other.attachmentId == this.attachmentId &&
          other.messageId == this.messageId);
}

class AttachmentMessageJoinCompanion
    extends UpdateCompanion<AttachmentMessageJoinData> {
  final Value<int> id;
  final Value<int> attachmentId;
  final Value<int> messageId;
  const AttachmentMessageJoinCompanion({
    this.id = const Value.absent(),
    this.attachmentId = const Value.absent(),
    this.messageId = const Value.absent(),
  });
  AttachmentMessageJoinCompanion.insert({
    this.id = const Value.absent(),
    @required int attachmentId,
    @required int messageId,
  })  : attachmentId = Value(attachmentId),
        messageId = Value(messageId);
  static Insertable<AttachmentMessageJoinData> custom({
    Expression<int> id,
    Expression<int> attachmentId,
    Expression<int> messageId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (attachmentId != null) 'attachmentId': attachmentId,
      if (messageId != null) 'messageId': messageId,
    });
  }

  AttachmentMessageJoinCompanion copyWith(
      {Value<int> id, Value<int> attachmentId, Value<int> messageId}) {
    return AttachmentMessageJoinCompanion(
      id: id ?? this.id,
      attachmentId: attachmentId ?? this.attachmentId,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (attachmentId.present) {
      map['attachmentId'] = Variable<int>(attachmentId.value);
    }
    if (messageId.present) {
      map['messageId'] = Variable<int>(messageId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentMessageJoinCompanion(')
          ..write('id: $id, ')
          ..write('attachmentId: $attachmentId, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }
}

class AttachmentMessageJoin extends Table
    with TableInfo<AttachmentMessageJoin, AttachmentMessageJoinData> {
  final GeneratedDatabase _db;
  final String _alias;
  AttachmentMessageJoin(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        declaredAsPrimaryKey: true,
        hasAutoIncrement: true,
        $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  }

  final VerificationMeta _attachmentIdMeta =
      const VerificationMeta('attachmentId');
  GeneratedIntColumn _attachmentId;
  GeneratedIntColumn get attachmentId =>
      _attachmentId ??= _constructAttachmentId();
  GeneratedIntColumn _constructAttachmentId() {
    return GeneratedIntColumn('attachmentId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _messageIdMeta = const VerificationMeta('messageId');
  GeneratedIntColumn _messageId;
  GeneratedIntColumn get messageId => _messageId ??= _constructMessageId();
  GeneratedIntColumn _constructMessageId() {
    return GeneratedIntColumn('messageId', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  @override
  List<GeneratedColumn> get $columns => [id, attachmentId, messageId];
  @override
  AttachmentMessageJoin get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attachment_message_join';
  @override
  final String actualTableName = 'attachment_message_join';
  @override
  VerificationContext validateIntegrity(
      Insertable<AttachmentMessageJoinData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('attachmentId')) {
      context.handle(
          _attachmentIdMeta,
          attachmentId.isAcceptableOrUnknown(
              data['attachmentId'], _attachmentIdMeta));
    } else if (isInserting) {
      context.missing(_attachmentIdMeta);
    }
    if (data.containsKey('messageId')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['messageId'], _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttachmentMessageJoinData map(Map<String, dynamic> data,
      {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AttachmentMessageJoinData.fromData(data, _db,
        prefix: effectivePrefix);
  }

  @override
  AttachmentMessageJoin createAlias(String alias) {
    return AttachmentMessageJoin(_db, alias);
  }

  @override
  List<String> get customConstraints => const [
        'FOREIGN KEY(attachmentId) REFERENCES attachment(id)',
        'FOREIGN KEY(messageId) REFERENCES message(id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class MessageEntity extends DataClass implements Insertable<MessageEntity> {
  final int id;
  final int originalROWID;
  final int handleId;
  final String guid;
  final String contentText;
  final String subject;
  final String country;
  final int error;
  final DateTime dateCreated;
  final DateTime dateRead;
  final DateTime dateDelivered;
  final bool isFromMe;
  final bool isDelayed;
  final bool isAutoReply;
  final bool isSystemMessage;
  final bool isServiceMessage;
  final bool isForward;
  final bool isArchived;
  final String cacheRoomnames;
  final bool isAudioMessage;
  final DateTime datePlayed;
  final int itemType;
  final String groupTitle;
  final int groupActionType;
  final bool isExpired;
  final String associatedMessageGuid;
  final String associatedMessageType;
  final String expressiveSendStyleId;
  final int timeExpressiveSendStyleId;
  final bool hasAttachments;
  final bool hasReactions;
  MessageEntity(
      {@required this.id,
      this.originalROWID,
      @required this.handleId,
      @required this.guid,
      @required this.contentText,
      this.subject,
      this.country,
      @required this.error,
      this.dateCreated,
      this.dateRead,
      this.dateDelivered,
      @required this.isFromMe,
      @required this.isDelayed,
      @required this.isAutoReply,
      @required this.isSystemMessage,
      @required this.isServiceMessage,
      @required this.isForward,
      @required this.isArchived,
      this.cacheRoomnames,
      @required this.isAudioMessage,
      this.datePlayed,
      @required this.itemType,
      this.groupTitle,
      @required this.groupActionType,
      @required this.isExpired,
      this.associatedMessageGuid,
      this.associatedMessageType,
      this.expressiveSendStyleId,
      @required this.timeExpressiveSendStyleId,
      @required this.hasAttachments,
      @required this.hasReactions});
  factory MessageEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return MessageEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      originalROWID: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}originalROWID']),
      handleId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}handleId']),
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      contentText:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}text']),
      subject:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}subject']),
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      error: intType.mapFromDatabaseResponse(data['${effectivePrefix}error']),
      dateCreated: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}dateCreated']),
      dateRead: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}dateRead']),
      dateDelivered: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}dateDelivered']),
      isFromMe:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isFromMe']),
      isDelayed:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isDelayed']),
      isAutoReply: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isAutoReply']),
      isSystemMessage: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isSystemMessage']),
      isServiceMessage: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isServiceMessage']),
      isForward:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isForward']),
      isArchived: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isArchived']),
      cacheRoomnames: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cacheRoomnames']),
      isAudioMessage: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isAudioMessage']),
      datePlayed: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}datePlayed']),
      itemType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}itemType']),
      groupTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}groupTitle']),
      groupActionType: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}groupActionType']),
      isExpired:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isExpired']),
      associatedMessageGuid: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}associatedMessageGuid']),
      associatedMessageType: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}associatedMessageType']),
      expressiveSendStyleId: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}expressiveSendStyleId']),
      timeExpressiveSendStyleId: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}timeExpressiveSendStyleId']),
      hasAttachments: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}hasAttachments']),
      hasReactions: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}hasReactions']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || originalROWID != null) {
      map['originalROWID'] = Variable<int>(originalROWID);
    }
    if (!nullToAbsent || handleId != null) {
      map['handleId'] = Variable<int>(handleId);
    }
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || contentText != null) {
      map['text'] = Variable<String>(contentText);
    }
    if (!nullToAbsent || subject != null) {
      map['subject'] = Variable<String>(subject);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<int>(error);
    }
    if (!nullToAbsent || dateCreated != null) {
      map['dateCreated'] = Variable<DateTime>(dateCreated);
    }
    if (!nullToAbsent || dateRead != null) {
      map['dateRead'] = Variable<DateTime>(dateRead);
    }
    if (!nullToAbsent || dateDelivered != null) {
      map['dateDelivered'] = Variable<DateTime>(dateDelivered);
    }
    if (!nullToAbsent || isFromMe != null) {
      map['isFromMe'] = Variable<bool>(isFromMe);
    }
    if (!nullToAbsent || isDelayed != null) {
      map['isDelayed'] = Variable<bool>(isDelayed);
    }
    if (!nullToAbsent || isAutoReply != null) {
      map['isAutoReply'] = Variable<bool>(isAutoReply);
    }
    if (!nullToAbsent || isSystemMessage != null) {
      map['isSystemMessage'] = Variable<bool>(isSystemMessage);
    }
    if (!nullToAbsent || isServiceMessage != null) {
      map['isServiceMessage'] = Variable<bool>(isServiceMessage);
    }
    if (!nullToAbsent || isForward != null) {
      map['isForward'] = Variable<bool>(isForward);
    }
    if (!nullToAbsent || isArchived != null) {
      map['isArchived'] = Variable<bool>(isArchived);
    }
    if (!nullToAbsent || cacheRoomnames != null) {
      map['cacheRoomnames'] = Variable<String>(cacheRoomnames);
    }
    if (!nullToAbsent || isAudioMessage != null) {
      map['isAudioMessage'] = Variable<bool>(isAudioMessage);
    }
    if (!nullToAbsent || datePlayed != null) {
      map['datePlayed'] = Variable<DateTime>(datePlayed);
    }
    if (!nullToAbsent || itemType != null) {
      map['itemType'] = Variable<int>(itemType);
    }
    if (!nullToAbsent || groupTitle != null) {
      map['groupTitle'] = Variable<String>(groupTitle);
    }
    if (!nullToAbsent || groupActionType != null) {
      map['groupActionType'] = Variable<int>(groupActionType);
    }
    if (!nullToAbsent || isExpired != null) {
      map['isExpired'] = Variable<bool>(isExpired);
    }
    if (!nullToAbsent || associatedMessageGuid != null) {
      map['associatedMessageGuid'] = Variable<String>(associatedMessageGuid);
    }
    if (!nullToAbsent || associatedMessageType != null) {
      map['associatedMessageType'] = Variable<String>(associatedMessageType);
    }
    if (!nullToAbsent || expressiveSendStyleId != null) {
      map['expressiveSendStyleId'] = Variable<String>(expressiveSendStyleId);
    }
    if (!nullToAbsent || timeExpressiveSendStyleId != null) {
      map['timeExpressiveSendStyleId'] =
          Variable<int>(timeExpressiveSendStyleId);
    }
    if (!nullToAbsent || hasAttachments != null) {
      map['hasAttachments'] = Variable<bool>(hasAttachments);
    }
    if (!nullToAbsent || hasReactions != null) {
      map['hasReactions'] = Variable<bool>(hasReactions);
    }
    return map;
  }

  MessageTableCompanion toCompanion(bool nullToAbsent) {
    return MessageTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      originalROWID: originalROWID == null && nullToAbsent
          ? const Value.absent()
          : Value(originalROWID),
      handleId: handleId == null && nullToAbsent
          ? const Value.absent()
          : Value(handleId),
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      contentText: contentText == null && nullToAbsent
          ? const Value.absent()
          : Value(contentText),
      subject: subject == null && nullToAbsent
          ? const Value.absent()
          : Value(subject),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      error:
          error == null && nullToAbsent ? const Value.absent() : Value(error),
      dateCreated: dateCreated == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCreated),
      dateRead: dateRead == null && nullToAbsent
          ? const Value.absent()
          : Value(dateRead),
      dateDelivered: dateDelivered == null && nullToAbsent
          ? const Value.absent()
          : Value(dateDelivered),
      isFromMe: isFromMe == null && nullToAbsent
          ? const Value.absent()
          : Value(isFromMe),
      isDelayed: isDelayed == null && nullToAbsent
          ? const Value.absent()
          : Value(isDelayed),
      isAutoReply: isAutoReply == null && nullToAbsent
          ? const Value.absent()
          : Value(isAutoReply),
      isSystemMessage: isSystemMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(isSystemMessage),
      isServiceMessage: isServiceMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(isServiceMessage),
      isForward: isForward == null && nullToAbsent
          ? const Value.absent()
          : Value(isForward),
      isArchived: isArchived == null && nullToAbsent
          ? const Value.absent()
          : Value(isArchived),
      cacheRoomnames: cacheRoomnames == null && nullToAbsent
          ? const Value.absent()
          : Value(cacheRoomnames),
      isAudioMessage: isAudioMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(isAudioMessage),
      datePlayed: datePlayed == null && nullToAbsent
          ? const Value.absent()
          : Value(datePlayed),
      itemType: itemType == null && nullToAbsent
          ? const Value.absent()
          : Value(itemType),
      groupTitle: groupTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(groupTitle),
      groupActionType: groupActionType == null && nullToAbsent
          ? const Value.absent()
          : Value(groupActionType),
      isExpired: isExpired == null && nullToAbsent
          ? const Value.absent()
          : Value(isExpired),
      associatedMessageGuid: associatedMessageGuid == null && nullToAbsent
          ? const Value.absent()
          : Value(associatedMessageGuid),
      associatedMessageType: associatedMessageType == null && nullToAbsent
          ? const Value.absent()
          : Value(associatedMessageType),
      expressiveSendStyleId: expressiveSendStyleId == null && nullToAbsent
          ? const Value.absent()
          : Value(expressiveSendStyleId),
      timeExpressiveSendStyleId:
          timeExpressiveSendStyleId == null && nullToAbsent
              ? const Value.absent()
              : Value(timeExpressiveSendStyleId),
      hasAttachments: hasAttachments == null && nullToAbsent
          ? const Value.absent()
          : Value(hasAttachments),
      hasReactions: hasReactions == null && nullToAbsent
          ? const Value.absent()
          : Value(hasReactions),
    );
  }

  factory MessageEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MessageEntity(
      id: serializer.fromJson<int>(json['ROWID']),
      originalROWID: serializer.fromJson<int>(json['originalROWID']),
      handleId: serializer.fromJson<int>(json['handleId']),
      guid: serializer.fromJson<String>(json['guid']),
      contentText: serializer.fromJson<String>(json['text']),
      subject: serializer.fromJson<String>(json['subject']),
      country: serializer.fromJson<String>(json['country']),
      error: serializer.fromJson<int>(json['error']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
      dateRead: serializer.fromJson<DateTime>(json['dateRead']),
      dateDelivered: serializer.fromJson<DateTime>(json['dateDelivered']),
      isFromMe: serializer.fromJson<bool>(json['isFromMe']),
      isDelayed: serializer.fromJson<bool>(json['isDelayed']),
      isAutoReply: serializer.fromJson<bool>(json['isAutoReply']),
      isSystemMessage: serializer.fromJson<bool>(json['isSystemMessage']),
      isServiceMessage: serializer.fromJson<bool>(json['isServiceMessage']),
      isForward: serializer.fromJson<bool>(json['isForward']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      cacheRoomnames: serializer.fromJson<String>(json['cacheRoomnames']),
      isAudioMessage: serializer.fromJson<bool>(json['isAudioMessage']),
      datePlayed: serializer.fromJson<DateTime>(json['datePlayed']),
      itemType: serializer.fromJson<int>(json['itemType']),
      groupTitle: serializer.fromJson<String>(json['groupTitle']),
      groupActionType: serializer.fromJson<int>(json['groupActionType']),
      isExpired: serializer.fromJson<bool>(json['isExpired']),
      associatedMessageGuid:
          serializer.fromJson<String>(json['associatedMessageGuid']),
      associatedMessageType:
          serializer.fromJson<String>(json['associatedMessageType']),
      expressiveSendStyleId:
          serializer.fromJson<String>(json['expressiveSendStyleId']),
      timeExpressiveSendStyleId:
          serializer.fromJson<int>(json['timeExpressiveSendStyleId']),
      hasAttachments: serializer.fromJson<bool>(json['hasAttachments']),
      hasReactions: serializer.fromJson<bool>(json['hasReactions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ROWID': serializer.toJson<int>(id),
      'originalROWID': serializer.toJson<int>(originalROWID),
      'handleId': serializer.toJson<int>(handleId),
      'guid': serializer.toJson<String>(guid),
      'text': serializer.toJson<String>(contentText),
      'subject': serializer.toJson<String>(subject),
      'country': serializer.toJson<String>(country),
      'error': serializer.toJson<int>(error),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
      'dateRead': serializer.toJson<DateTime>(dateRead),
      'dateDelivered': serializer.toJson<DateTime>(dateDelivered),
      'isFromMe': serializer.toJson<bool>(isFromMe),
      'isDelayed': serializer.toJson<bool>(isDelayed),
      'isAutoReply': serializer.toJson<bool>(isAutoReply),
      'isSystemMessage': serializer.toJson<bool>(isSystemMessage),
      'isServiceMessage': serializer.toJson<bool>(isServiceMessage),
      'isForward': serializer.toJson<bool>(isForward),
      'isArchived': serializer.toJson<bool>(isArchived),
      'cacheRoomnames': serializer.toJson<String>(cacheRoomnames),
      'isAudioMessage': serializer.toJson<bool>(isAudioMessage),
      'datePlayed': serializer.toJson<DateTime>(datePlayed),
      'itemType': serializer.toJson<int>(itemType),
      'groupTitle': serializer.toJson<String>(groupTitle),
      'groupActionType': serializer.toJson<int>(groupActionType),
      'isExpired': serializer.toJson<bool>(isExpired),
      'associatedMessageGuid': serializer.toJson<String>(associatedMessageGuid),
      'associatedMessageType': serializer.toJson<String>(associatedMessageType),
      'expressiveSendStyleId': serializer.toJson<String>(expressiveSendStyleId),
      'timeExpressiveSendStyleId':
          serializer.toJson<int>(timeExpressiveSendStyleId),
      'hasAttachments': serializer.toJson<bool>(hasAttachments),
      'hasReactions': serializer.toJson<bool>(hasReactions),
    };
  }

  MessageEntity copyWith(
          {int id,
          int originalROWID,
          int handleId,
          String guid,
          String contentText,
          String subject,
          String country,
          int error,
          DateTime dateCreated,
          DateTime dateRead,
          DateTime dateDelivered,
          bool isFromMe,
          bool isDelayed,
          bool isAutoReply,
          bool isSystemMessage,
          bool isServiceMessage,
          bool isForward,
          bool isArchived,
          String cacheRoomnames,
          bool isAudioMessage,
          DateTime datePlayed,
          int itemType,
          String groupTitle,
          int groupActionType,
          bool isExpired,
          String associatedMessageGuid,
          String associatedMessageType,
          String expressiveSendStyleId,
          int timeExpressiveSendStyleId,
          bool hasAttachments,
          bool hasReactions}) =>
      MessageEntity(
        id: id ?? this.id,
        originalROWID: originalROWID ?? this.originalROWID,
        handleId: handleId ?? this.handleId,
        guid: guid ?? this.guid,
        contentText: contentText ?? this.contentText,
        subject: subject ?? this.subject,
        country: country ?? this.country,
        error: error ?? this.error,
        dateCreated: dateCreated ?? this.dateCreated,
        dateRead: dateRead ?? this.dateRead,
        dateDelivered: dateDelivered ?? this.dateDelivered,
        isFromMe: isFromMe ?? this.isFromMe,
        isDelayed: isDelayed ?? this.isDelayed,
        isAutoReply: isAutoReply ?? this.isAutoReply,
        isSystemMessage: isSystemMessage ?? this.isSystemMessage,
        isServiceMessage: isServiceMessage ?? this.isServiceMessage,
        isForward: isForward ?? this.isForward,
        isArchived: isArchived ?? this.isArchived,
        cacheRoomnames: cacheRoomnames ?? this.cacheRoomnames,
        isAudioMessage: isAudioMessage ?? this.isAudioMessage,
        datePlayed: datePlayed ?? this.datePlayed,
        itemType: itemType ?? this.itemType,
        groupTitle: groupTitle ?? this.groupTitle,
        groupActionType: groupActionType ?? this.groupActionType,
        isExpired: isExpired ?? this.isExpired,
        associatedMessageGuid:
            associatedMessageGuid ?? this.associatedMessageGuid,
        associatedMessageType:
            associatedMessageType ?? this.associatedMessageType,
        expressiveSendStyleId:
            expressiveSendStyleId ?? this.expressiveSendStyleId,
        timeExpressiveSendStyleId:
            timeExpressiveSendStyleId ?? this.timeExpressiveSendStyleId,
        hasAttachments: hasAttachments ?? this.hasAttachments,
        hasReactions: hasReactions ?? this.hasReactions,
      );
  @override
  String toString() {
    return (StringBuffer('MessageEntity(')
          ..write('id: $id, ')
          ..write('originalROWID: $originalROWID, ')
          ..write('handleId: $handleId, ')
          ..write('guid: $guid, ')
          ..write('contentText: $contentText, ')
          ..write('subject: $subject, ')
          ..write('country: $country, ')
          ..write('error: $error, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateRead: $dateRead, ')
          ..write('dateDelivered: $dateDelivered, ')
          ..write('isFromMe: $isFromMe, ')
          ..write('isDelayed: $isDelayed, ')
          ..write('isAutoReply: $isAutoReply, ')
          ..write('isSystemMessage: $isSystemMessage, ')
          ..write('isServiceMessage: $isServiceMessage, ')
          ..write('isForward: $isForward, ')
          ..write('isArchived: $isArchived, ')
          ..write('cacheRoomnames: $cacheRoomnames, ')
          ..write('isAudioMessage: $isAudioMessage, ')
          ..write('datePlayed: $datePlayed, ')
          ..write('itemType: $itemType, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('groupActionType: $groupActionType, ')
          ..write('isExpired: $isExpired, ')
          ..write('associatedMessageGuid: $associatedMessageGuid, ')
          ..write('associatedMessageType: $associatedMessageType, ')
          ..write('expressiveSendStyleId: $expressiveSendStyleId, ')
          ..write('timeExpressiveSendStyleId: $timeExpressiveSendStyleId, ')
          ..write('hasAttachments: $hasAttachments, ')
          ..write('hasReactions: $hasReactions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          originalROWID.hashCode,
          $mrjc(
              handleId.hashCode,
              $mrjc(
                  guid.hashCode,
                  $mrjc(
                      contentText.hashCode,
                      $mrjc(
                          subject.hashCode,
                          $mrjc(
                              country.hashCode,
                              $mrjc(
                                  error.hashCode,
                                  $mrjc(
                                      dateCreated.hashCode,
                                      $mrjc(
                                          dateRead.hashCode,
                                          $mrjc(
                                              dateDelivered.hashCode,
                                              $mrjc(
                                                  isFromMe.hashCode,
                                                  $mrjc(
                                                      isDelayed.hashCode,
                                                      $mrjc(
                                                          isAutoReply.hashCode,
                                                          $mrjc(
                                                              isSystemMessage
                                                                  .hashCode,
                                                              $mrjc(
                                                                  isServiceMessage
                                                                      .hashCode,
                                                                  $mrjc(
                                                                      isForward
                                                                          .hashCode,
                                                                      $mrjc(
                                                                          isArchived
                                                                              .hashCode,
                                                                          $mrjc(
                                                                              cacheRoomnames.hashCode,
                                                                              $mrjc(isAudioMessage.hashCode, $mrjc(datePlayed.hashCode, $mrjc(itemType.hashCode, $mrjc(groupTitle.hashCode, $mrjc(groupActionType.hashCode, $mrjc(isExpired.hashCode, $mrjc(associatedMessageGuid.hashCode, $mrjc(associatedMessageType.hashCode, $mrjc(expressiveSendStyleId.hashCode, $mrjc(timeExpressiveSendStyleId.hashCode, $mrjc(hasAttachments.hashCode, hasReactions.hashCode)))))))))))))))))))))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MessageEntity &&
          other.id == this.id &&
          other.originalROWID == this.originalROWID &&
          other.handleId == this.handleId &&
          other.guid == this.guid &&
          other.contentText == this.contentText &&
          other.subject == this.subject &&
          other.country == this.country &&
          other.error == this.error &&
          other.dateCreated == this.dateCreated &&
          other.dateRead == this.dateRead &&
          other.dateDelivered == this.dateDelivered &&
          other.isFromMe == this.isFromMe &&
          other.isDelayed == this.isDelayed &&
          other.isAutoReply == this.isAutoReply &&
          other.isSystemMessage == this.isSystemMessage &&
          other.isServiceMessage == this.isServiceMessage &&
          other.isForward == this.isForward &&
          other.isArchived == this.isArchived &&
          other.cacheRoomnames == this.cacheRoomnames &&
          other.isAudioMessage == this.isAudioMessage &&
          other.datePlayed == this.datePlayed &&
          other.itemType == this.itemType &&
          other.groupTitle == this.groupTitle &&
          other.groupActionType == this.groupActionType &&
          other.isExpired == this.isExpired &&
          other.associatedMessageGuid == this.associatedMessageGuid &&
          other.associatedMessageType == this.associatedMessageType &&
          other.expressiveSendStyleId == this.expressiveSendStyleId &&
          other.timeExpressiveSendStyleId == this.timeExpressiveSendStyleId &&
          other.hasAttachments == this.hasAttachments &&
          other.hasReactions == this.hasReactions);
}

class MessageTableCompanion extends UpdateCompanion<MessageEntity> {
  final Value<int> id;
  final Value<int> originalROWID;
  final Value<int> handleId;
  final Value<String> guid;
  final Value<String> contentText;
  final Value<String> subject;
  final Value<String> country;
  final Value<int> error;
  final Value<DateTime> dateCreated;
  final Value<DateTime> dateRead;
  final Value<DateTime> dateDelivered;
  final Value<bool> isFromMe;
  final Value<bool> isDelayed;
  final Value<bool> isAutoReply;
  final Value<bool> isSystemMessage;
  final Value<bool> isServiceMessage;
  final Value<bool> isForward;
  final Value<bool> isArchived;
  final Value<String> cacheRoomnames;
  final Value<bool> isAudioMessage;
  final Value<DateTime> datePlayed;
  final Value<int> itemType;
  final Value<String> groupTitle;
  final Value<int> groupActionType;
  final Value<bool> isExpired;
  final Value<String> associatedMessageGuid;
  final Value<String> associatedMessageType;
  final Value<String> expressiveSendStyleId;
  final Value<int> timeExpressiveSendStyleId;
  final Value<bool> hasAttachments;
  final Value<bool> hasReactions;
  const MessageTableCompanion({
    this.id = const Value.absent(),
    this.originalROWID = const Value.absent(),
    this.handleId = const Value.absent(),
    this.guid = const Value.absent(),
    this.contentText = const Value.absent(),
    this.subject = const Value.absent(),
    this.country = const Value.absent(),
    this.error = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateRead = const Value.absent(),
    this.dateDelivered = const Value.absent(),
    this.isFromMe = const Value.absent(),
    this.isDelayed = const Value.absent(),
    this.isAutoReply = const Value.absent(),
    this.isSystemMessage = const Value.absent(),
    this.isServiceMessage = const Value.absent(),
    this.isForward = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.cacheRoomnames = const Value.absent(),
    this.isAudioMessage = const Value.absent(),
    this.datePlayed = const Value.absent(),
    this.itemType = const Value.absent(),
    this.groupTitle = const Value.absent(),
    this.groupActionType = const Value.absent(),
    this.isExpired = const Value.absent(),
    this.associatedMessageGuid = const Value.absent(),
    this.associatedMessageType = const Value.absent(),
    this.expressiveSendStyleId = const Value.absent(),
    this.timeExpressiveSendStyleId = const Value.absent(),
    this.hasAttachments = const Value.absent(),
    this.hasReactions = const Value.absent(),
  });
  MessageTableCompanion.insert({
    this.id = const Value.absent(),
    this.originalROWID = const Value.absent(),
    @required int handleId,
    @required String guid,
    @required String contentText,
    this.subject = const Value.absent(),
    this.country = const Value.absent(),
    this.error = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.dateRead = const Value.absent(),
    this.dateDelivered = const Value.absent(),
    this.isFromMe = const Value.absent(),
    this.isDelayed = const Value.absent(),
    this.isAutoReply = const Value.absent(),
    this.isSystemMessage = const Value.absent(),
    this.isServiceMessage = const Value.absent(),
    this.isForward = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.cacheRoomnames = const Value.absent(),
    this.isAudioMessage = const Value.absent(),
    this.datePlayed = const Value.absent(),
    this.itemType = const Value.absent(),
    this.groupTitle = const Value.absent(),
    this.groupActionType = const Value.absent(),
    this.isExpired = const Value.absent(),
    this.associatedMessageGuid = const Value.absent(),
    this.associatedMessageType = const Value.absent(),
    this.expressiveSendStyleId = const Value.absent(),
    this.timeExpressiveSendStyleId = const Value.absent(),
    this.hasAttachments = const Value.absent(),
    this.hasReactions = const Value.absent(),
  })  : handleId = Value(handleId),
        guid = Value(guid),
        contentText = Value(contentText);
  static Insertable<MessageEntity> custom({
    Expression<int> id,
    Expression<int> originalROWID,
    Expression<int> handleId,
    Expression<String> guid,
    Expression<String> contentText,
    Expression<String> subject,
    Expression<String> country,
    Expression<int> error,
    Expression<DateTime> dateCreated,
    Expression<DateTime> dateRead,
    Expression<DateTime> dateDelivered,
    Expression<bool> isFromMe,
    Expression<bool> isDelayed,
    Expression<bool> isAutoReply,
    Expression<bool> isSystemMessage,
    Expression<bool> isServiceMessage,
    Expression<bool> isForward,
    Expression<bool> isArchived,
    Expression<String> cacheRoomnames,
    Expression<bool> isAudioMessage,
    Expression<DateTime> datePlayed,
    Expression<int> itemType,
    Expression<String> groupTitle,
    Expression<int> groupActionType,
    Expression<bool> isExpired,
    Expression<String> associatedMessageGuid,
    Expression<String> associatedMessageType,
    Expression<String> expressiveSendStyleId,
    Expression<int> timeExpressiveSendStyleId,
    Expression<bool> hasAttachments,
    Expression<bool> hasReactions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (originalROWID != null) 'originalROWID': originalROWID,
      if (handleId != null) 'handleId': handleId,
      if (guid != null) 'guid': guid,
      if (contentText != null) 'text': contentText,
      if (subject != null) 'subject': subject,
      if (country != null) 'country': country,
      if (error != null) 'error': error,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (dateRead != null) 'dateRead': dateRead,
      if (dateDelivered != null) 'dateDelivered': dateDelivered,
      if (isFromMe != null) 'isFromMe': isFromMe,
      if (isDelayed != null) 'isDelayed': isDelayed,
      if (isAutoReply != null) 'isAutoReply': isAutoReply,
      if (isSystemMessage != null) 'isSystemMessage': isSystemMessage,
      if (isServiceMessage != null) 'isServiceMessage': isServiceMessage,
      if (isForward != null) 'isForward': isForward,
      if (isArchived != null) 'isArchived': isArchived,
      if (cacheRoomnames != null) 'cacheRoomnames': cacheRoomnames,
      if (isAudioMessage != null) 'isAudioMessage': isAudioMessage,
      if (datePlayed != null) 'datePlayed': datePlayed,
      if (itemType != null) 'itemType': itemType,
      if (groupTitle != null) 'groupTitle': groupTitle,
      if (groupActionType != null) 'groupActionType': groupActionType,
      if (isExpired != null) 'isExpired': isExpired,
      if (associatedMessageGuid != null)
        'associatedMessageGuid': associatedMessageGuid,
      if (associatedMessageType != null)
        'associatedMessageType': associatedMessageType,
      if (expressiveSendStyleId != null)
        'expressiveSendStyleId': expressiveSendStyleId,
      if (timeExpressiveSendStyleId != null)
        'timeExpressiveSendStyleId': timeExpressiveSendStyleId,
      if (hasAttachments != null) 'hasAttachments': hasAttachments,
      if (hasReactions != null) 'hasReactions': hasReactions,
    });
  }

  MessageTableCompanion copyWith(
      {Value<int> id,
      Value<int> originalROWID,
      Value<int> handleId,
      Value<String> guid,
      Value<String> contentText,
      Value<String> subject,
      Value<String> country,
      Value<int> error,
      Value<DateTime> dateCreated,
      Value<DateTime> dateRead,
      Value<DateTime> dateDelivered,
      Value<bool> isFromMe,
      Value<bool> isDelayed,
      Value<bool> isAutoReply,
      Value<bool> isSystemMessage,
      Value<bool> isServiceMessage,
      Value<bool> isForward,
      Value<bool> isArchived,
      Value<String> cacheRoomnames,
      Value<bool> isAudioMessage,
      Value<DateTime> datePlayed,
      Value<int> itemType,
      Value<String> groupTitle,
      Value<int> groupActionType,
      Value<bool> isExpired,
      Value<String> associatedMessageGuid,
      Value<String> associatedMessageType,
      Value<String> expressiveSendStyleId,
      Value<int> timeExpressiveSendStyleId,
      Value<bool> hasAttachments,
      Value<bool> hasReactions}) {
    return MessageTableCompanion(
      id: id ?? this.id,
      originalROWID: originalROWID ?? this.originalROWID,
      handleId: handleId ?? this.handleId,
      guid: guid ?? this.guid,
      contentText: contentText ?? this.contentText,
      subject: subject ?? this.subject,
      country: country ?? this.country,
      error: error ?? this.error,
      dateCreated: dateCreated ?? this.dateCreated,
      dateRead: dateRead ?? this.dateRead,
      dateDelivered: dateDelivered ?? this.dateDelivered,
      isFromMe: isFromMe ?? this.isFromMe,
      isDelayed: isDelayed ?? this.isDelayed,
      isAutoReply: isAutoReply ?? this.isAutoReply,
      isSystemMessage: isSystemMessage ?? this.isSystemMessage,
      isServiceMessage: isServiceMessage ?? this.isServiceMessage,
      isForward: isForward ?? this.isForward,
      isArchived: isArchived ?? this.isArchived,
      cacheRoomnames: cacheRoomnames ?? this.cacheRoomnames,
      isAudioMessage: isAudioMessage ?? this.isAudioMessage,
      datePlayed: datePlayed ?? this.datePlayed,
      itemType: itemType ?? this.itemType,
      groupTitle: groupTitle ?? this.groupTitle,
      groupActionType: groupActionType ?? this.groupActionType,
      isExpired: isExpired ?? this.isExpired,
      associatedMessageGuid:
          associatedMessageGuid ?? this.associatedMessageGuid,
      associatedMessageType:
          associatedMessageType ?? this.associatedMessageType,
      expressiveSendStyleId:
          expressiveSendStyleId ?? this.expressiveSendStyleId,
      timeExpressiveSendStyleId:
          timeExpressiveSendStyleId ?? this.timeExpressiveSendStyleId,
      hasAttachments: hasAttachments ?? this.hasAttachments,
      hasReactions: hasReactions ?? this.hasReactions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (originalROWID.present) {
      map['originalROWID'] = Variable<int>(originalROWID.value);
    }
    if (handleId.present) {
      map['handleId'] = Variable<int>(handleId.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (contentText.present) {
      map['text'] = Variable<String>(contentText.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (error.present) {
      map['error'] = Variable<int>(error.value);
    }
    if (dateCreated.present) {
      map['dateCreated'] = Variable<DateTime>(dateCreated.value);
    }
    if (dateRead.present) {
      map['dateRead'] = Variable<DateTime>(dateRead.value);
    }
    if (dateDelivered.present) {
      map['dateDelivered'] = Variable<DateTime>(dateDelivered.value);
    }
    if (isFromMe.present) {
      map['isFromMe'] = Variable<bool>(isFromMe.value);
    }
    if (isDelayed.present) {
      map['isDelayed'] = Variable<bool>(isDelayed.value);
    }
    if (isAutoReply.present) {
      map['isAutoReply'] = Variable<bool>(isAutoReply.value);
    }
    if (isSystemMessage.present) {
      map['isSystemMessage'] = Variable<bool>(isSystemMessage.value);
    }
    if (isServiceMessage.present) {
      map['isServiceMessage'] = Variable<bool>(isServiceMessage.value);
    }
    if (isForward.present) {
      map['isForward'] = Variable<bool>(isForward.value);
    }
    if (isArchived.present) {
      map['isArchived'] = Variable<bool>(isArchived.value);
    }
    if (cacheRoomnames.present) {
      map['cacheRoomnames'] = Variable<String>(cacheRoomnames.value);
    }
    if (isAudioMessage.present) {
      map['isAudioMessage'] = Variable<bool>(isAudioMessage.value);
    }
    if (datePlayed.present) {
      map['datePlayed'] = Variable<DateTime>(datePlayed.value);
    }
    if (itemType.present) {
      map['itemType'] = Variable<int>(itemType.value);
    }
    if (groupTitle.present) {
      map['groupTitle'] = Variable<String>(groupTitle.value);
    }
    if (groupActionType.present) {
      map['groupActionType'] = Variable<int>(groupActionType.value);
    }
    if (isExpired.present) {
      map['isExpired'] = Variable<bool>(isExpired.value);
    }
    if (associatedMessageGuid.present) {
      map['associatedMessageGuid'] =
          Variable<String>(associatedMessageGuid.value);
    }
    if (associatedMessageType.present) {
      map['associatedMessageType'] =
          Variable<String>(associatedMessageType.value);
    }
    if (expressiveSendStyleId.present) {
      map['expressiveSendStyleId'] =
          Variable<String>(expressiveSendStyleId.value);
    }
    if (timeExpressiveSendStyleId.present) {
      map['timeExpressiveSendStyleId'] =
          Variable<int>(timeExpressiveSendStyleId.value);
    }
    if (hasAttachments.present) {
      map['hasAttachments'] = Variable<bool>(hasAttachments.value);
    }
    if (hasReactions.present) {
      map['hasReactions'] = Variable<bool>(hasReactions.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTableCompanion(')
          ..write('id: $id, ')
          ..write('originalROWID: $originalROWID, ')
          ..write('handleId: $handleId, ')
          ..write('guid: $guid, ')
          ..write('contentText: $contentText, ')
          ..write('subject: $subject, ')
          ..write('country: $country, ')
          ..write('error: $error, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('dateRead: $dateRead, ')
          ..write('dateDelivered: $dateDelivered, ')
          ..write('isFromMe: $isFromMe, ')
          ..write('isDelayed: $isDelayed, ')
          ..write('isAutoReply: $isAutoReply, ')
          ..write('isSystemMessage: $isSystemMessage, ')
          ..write('isServiceMessage: $isServiceMessage, ')
          ..write('isForward: $isForward, ')
          ..write('isArchived: $isArchived, ')
          ..write('cacheRoomnames: $cacheRoomnames, ')
          ..write('isAudioMessage: $isAudioMessage, ')
          ..write('datePlayed: $datePlayed, ')
          ..write('itemType: $itemType, ')
          ..write('groupTitle: $groupTitle, ')
          ..write('groupActionType: $groupActionType, ')
          ..write('isExpired: $isExpired, ')
          ..write('associatedMessageGuid: $associatedMessageGuid, ')
          ..write('associatedMessageType: $associatedMessageType, ')
          ..write('expressiveSendStyleId: $expressiveSendStyleId, ')
          ..write('timeExpressiveSendStyleId: $timeExpressiveSendStyleId, ')
          ..write('hasAttachments: $hasAttachments, ')
          ..write('hasReactions: $hasReactions')
          ..write(')'))
        .toString();
  }
}

class $MessageTableTable extends MessageTable
    with TableInfo<$MessageTableTable, MessageEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $MessageTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _originalROWIDMeta =
      const VerificationMeta('originalROWID');
  GeneratedIntColumn _originalROWID;
  @override
  GeneratedIntColumn get originalROWID =>
      _originalROWID ??= _constructOriginalROWID();
  GeneratedIntColumn _constructOriginalROWID() {
    return GeneratedIntColumn(
      'originalROWID',
      $tableName,
      true,
    );
  }

  final VerificationMeta _handleIdMeta = const VerificationMeta('handleId');
  GeneratedIntColumn _handleId;
  @override
  GeneratedIntColumn get handleId => _handleId ??= _constructHandleId();
  GeneratedIntColumn _constructHandleId() {
    return GeneratedIntColumn(
      'handleId',
      $tableName,
      false,
    );
  }

  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn(
      'guid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentTextMeta =
      const VerificationMeta('contentText');
  GeneratedTextColumn _contentText;
  @override
  GeneratedTextColumn get contentText =>
      _contentText ??= _constructContentText();
  GeneratedTextColumn _constructContentText() {
    return GeneratedTextColumn(
      'text',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subjectMeta = const VerificationMeta('subject');
  GeneratedTextColumn _subject;
  @override
  GeneratedTextColumn get subject => _subject ??= _constructSubject();
  GeneratedTextColumn _constructSubject() {
    return GeneratedTextColumn(
      'subject',
      $tableName,
      true,
    );
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      true,
    );
  }

  final VerificationMeta _errorMeta = const VerificationMeta('error');
  GeneratedIntColumn _error;
  @override
  GeneratedIntColumn get error => _error ??= _constructError();
  GeneratedIntColumn _constructError() {
    return GeneratedIntColumn('error', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  GeneratedDateTimeColumn _dateCreated;
  @override
  GeneratedDateTimeColumn get dateCreated =>
      _dateCreated ??= _constructDateCreated();
  GeneratedDateTimeColumn _constructDateCreated() {
    return GeneratedDateTimeColumn(
      'dateCreated',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateReadMeta = const VerificationMeta('dateRead');
  GeneratedDateTimeColumn _dateRead;
  @override
  GeneratedDateTimeColumn get dateRead => _dateRead ??= _constructDateRead();
  GeneratedDateTimeColumn _constructDateRead() {
    return GeneratedDateTimeColumn(
      'dateRead',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateDeliveredMeta =
      const VerificationMeta('dateDelivered');
  GeneratedDateTimeColumn _dateDelivered;
  @override
  GeneratedDateTimeColumn get dateDelivered =>
      _dateDelivered ??= _constructDateDelivered();
  GeneratedDateTimeColumn _constructDateDelivered() {
    return GeneratedDateTimeColumn(
      'dateDelivered',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isFromMeMeta = const VerificationMeta('isFromMe');
  GeneratedBoolColumn _isFromMe;
  @override
  GeneratedBoolColumn get isFromMe => _isFromMe ??= _constructIsFromMe();
  GeneratedBoolColumn _constructIsFromMe() {
    return GeneratedBoolColumn('isFromMe', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isDelayedMeta = const VerificationMeta('isDelayed');
  GeneratedBoolColumn _isDelayed;
  @override
  GeneratedBoolColumn get isDelayed => _isDelayed ??= _constructIsDelayed();
  GeneratedBoolColumn _constructIsDelayed() {
    return GeneratedBoolColumn('isDelayed', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isAutoReplyMeta =
      const VerificationMeta('isAutoReply');
  GeneratedBoolColumn _isAutoReply;
  @override
  GeneratedBoolColumn get isAutoReply =>
      _isAutoReply ??= _constructIsAutoReply();
  GeneratedBoolColumn _constructIsAutoReply() {
    return GeneratedBoolColumn('isAutoReply', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isSystemMessageMeta =
      const VerificationMeta('isSystemMessage');
  GeneratedBoolColumn _isSystemMessage;
  @override
  GeneratedBoolColumn get isSystemMessage =>
      _isSystemMessage ??= _constructIsSystemMessage();
  GeneratedBoolColumn _constructIsSystemMessage() {
    return GeneratedBoolColumn('isSystemMessage', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isServiceMessageMeta =
      const VerificationMeta('isServiceMessage');
  GeneratedBoolColumn _isServiceMessage;
  @override
  GeneratedBoolColumn get isServiceMessage =>
      _isServiceMessage ??= _constructIsServiceMessage();
  GeneratedBoolColumn _constructIsServiceMessage() {
    return GeneratedBoolColumn('isServiceMessage', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isForwardMeta = const VerificationMeta('isForward');
  GeneratedBoolColumn _isForward;
  @override
  GeneratedBoolColumn get isForward => _isForward ??= _constructIsForward();
  GeneratedBoolColumn _constructIsForward() {
    return GeneratedBoolColumn('isForward', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isArchivedMeta = const VerificationMeta('isArchived');
  GeneratedBoolColumn _isArchived;
  @override
  GeneratedBoolColumn get isArchived => _isArchived ??= _constructIsArchived();
  GeneratedBoolColumn _constructIsArchived() {
    return GeneratedBoolColumn('isArchived', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _cacheRoomnamesMeta =
      const VerificationMeta('cacheRoomnames');
  GeneratedTextColumn _cacheRoomnames;
  @override
  GeneratedTextColumn get cacheRoomnames =>
      _cacheRoomnames ??= _constructCacheRoomnames();
  GeneratedTextColumn _constructCacheRoomnames() {
    return GeneratedTextColumn(
      'cacheRoomnames',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isAudioMessageMeta =
      const VerificationMeta('isAudioMessage');
  GeneratedBoolColumn _isAudioMessage;
  @override
  GeneratedBoolColumn get isAudioMessage =>
      _isAudioMessage ??= _constructIsAudioMessage();
  GeneratedBoolColumn _constructIsAudioMessage() {
    return GeneratedBoolColumn('isAudioMessage', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _datePlayedMeta = const VerificationMeta('datePlayed');
  GeneratedDateTimeColumn _datePlayed;
  @override
  GeneratedDateTimeColumn get datePlayed =>
      _datePlayed ??= _constructDatePlayed();
  GeneratedDateTimeColumn _constructDatePlayed() {
    return GeneratedDateTimeColumn(
      'datePlayed',
      $tableName,
      true,
    );
  }

  final VerificationMeta _itemTypeMeta = const VerificationMeta('itemType');
  GeneratedIntColumn _itemType;
  @override
  GeneratedIntColumn get itemType => _itemType ??= _constructItemType();
  GeneratedIntColumn _constructItemType() {
    return GeneratedIntColumn('itemType', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _groupTitleMeta = const VerificationMeta('groupTitle');
  GeneratedTextColumn _groupTitle;
  @override
  GeneratedTextColumn get groupTitle => _groupTitle ??= _constructGroupTitle();
  GeneratedTextColumn _constructGroupTitle() {
    return GeneratedTextColumn(
      'groupTitle',
      $tableName,
      true,
    );
  }

  final VerificationMeta _groupActionTypeMeta =
      const VerificationMeta('groupActionType');
  GeneratedIntColumn _groupActionType;
  @override
  GeneratedIntColumn get groupActionType =>
      _groupActionType ??= _constructGroupActionType();
  GeneratedIntColumn _constructGroupActionType() {
    return GeneratedIntColumn('groupActionType', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _isExpiredMeta = const VerificationMeta('isExpired');
  GeneratedBoolColumn _isExpired;
  @override
  GeneratedBoolColumn get isExpired => _isExpired ??= _constructIsExpired();
  GeneratedBoolColumn _constructIsExpired() {
    return GeneratedBoolColumn('isExpired', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _associatedMessageGuidMeta =
      const VerificationMeta('associatedMessageGuid');
  GeneratedTextColumn _associatedMessageGuid;
  @override
  GeneratedTextColumn get associatedMessageGuid =>
      _associatedMessageGuid ??= _constructAssociatedMessageGuid();
  GeneratedTextColumn _constructAssociatedMessageGuid() {
    return GeneratedTextColumn(
      'associatedMessageGuid',
      $tableName,
      true,
    );
  }

  final VerificationMeta _associatedMessageTypeMeta =
      const VerificationMeta('associatedMessageType');
  GeneratedTextColumn _associatedMessageType;
  @override
  GeneratedTextColumn get associatedMessageType =>
      _associatedMessageType ??= _constructAssociatedMessageType();
  GeneratedTextColumn _constructAssociatedMessageType() {
    return GeneratedTextColumn(
      'associatedMessageType',
      $tableName,
      true,
    );
  }

  final VerificationMeta _expressiveSendStyleIdMeta =
      const VerificationMeta('expressiveSendStyleId');
  GeneratedTextColumn _expressiveSendStyleId;
  @override
  GeneratedTextColumn get expressiveSendStyleId =>
      _expressiveSendStyleId ??= _constructExpressiveSendStyleId();
  GeneratedTextColumn _constructExpressiveSendStyleId() {
    return GeneratedTextColumn(
      'expressiveSendStyleId',
      $tableName,
      true,
    );
  }

  final VerificationMeta _timeExpressiveSendStyleIdMeta =
      const VerificationMeta('timeExpressiveSendStyleId');
  GeneratedIntColumn _timeExpressiveSendStyleId;
  @override
  GeneratedIntColumn get timeExpressiveSendStyleId =>
      _timeExpressiveSendStyleId ??= _constructTimeExpressiveSendStyleId();
  GeneratedIntColumn _constructTimeExpressiveSendStyleId() {
    return GeneratedIntColumn('timeExpressiveSendStyleId', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _hasAttachmentsMeta =
      const VerificationMeta('hasAttachments');
  GeneratedBoolColumn _hasAttachments;
  @override
  GeneratedBoolColumn get hasAttachments =>
      _hasAttachments ??= _constructHasAttachments();
  GeneratedBoolColumn _constructHasAttachments() {
    return GeneratedBoolColumn('hasAttachments', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _hasReactionsMeta =
      const VerificationMeta('hasReactions');
  GeneratedBoolColumn _hasReactions;
  @override
  GeneratedBoolColumn get hasReactions =>
      _hasReactions ??= _constructHasReactions();
  GeneratedBoolColumn _constructHasReactions() {
    return GeneratedBoolColumn('hasReactions', $tableName, false,
        defaultValue: const Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        originalROWID,
        handleId,
        guid,
        contentText,
        subject,
        country,
        error,
        dateCreated,
        dateRead,
        dateDelivered,
        isFromMe,
        isDelayed,
        isAutoReply,
        isSystemMessage,
        isServiceMessage,
        isForward,
        isArchived,
        cacheRoomnames,
        isAudioMessage,
        datePlayed,
        itemType,
        groupTitle,
        groupActionType,
        isExpired,
        associatedMessageGuid,
        associatedMessageType,
        expressiveSendStyleId,
        timeExpressiveSendStyleId,
        hasAttachments,
        hasReactions
      ];
  @override
  $MessageTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'message';
  @override
  final String actualTableName = 'message';
  @override
  VerificationContext validateIntegrity(Insertable<MessageEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('originalROWID')) {
      context.handle(
          _originalROWIDMeta,
          originalROWID.isAcceptableOrUnknown(
              data['originalROWID'], _originalROWIDMeta));
    }
    if (data.containsKey('handleId')) {
      context.handle(_handleIdMeta,
          handleId.isAcceptableOrUnknown(data['handleId'], _handleIdMeta));
    } else if (isInserting) {
      context.missing(_handleIdMeta);
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('text')) {
      context.handle(_contentTextMeta,
          contentText.isAcceptableOrUnknown(data['text'], _contentTextMeta));
    } else if (isInserting) {
      context.missing(_contentTextMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject'], _subjectMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country'], _countryMeta));
    }
    if (data.containsKey('error')) {
      context.handle(
          _errorMeta, error.isAcceptableOrUnknown(data['error'], _errorMeta));
    }
    if (data.containsKey('dateCreated')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['dateCreated'], _dateCreatedMeta));
    }
    if (data.containsKey('dateRead')) {
      context.handle(_dateReadMeta,
          dateRead.isAcceptableOrUnknown(data['dateRead'], _dateReadMeta));
    }
    if (data.containsKey('dateDelivered')) {
      context.handle(
          _dateDeliveredMeta,
          dateDelivered.isAcceptableOrUnknown(
              data['dateDelivered'], _dateDeliveredMeta));
    }
    if (data.containsKey('isFromMe')) {
      context.handle(_isFromMeMeta,
          isFromMe.isAcceptableOrUnknown(data['isFromMe'], _isFromMeMeta));
    }
    if (data.containsKey('isDelayed')) {
      context.handle(_isDelayedMeta,
          isDelayed.isAcceptableOrUnknown(data['isDelayed'], _isDelayedMeta));
    }
    if (data.containsKey('isAutoReply')) {
      context.handle(
          _isAutoReplyMeta,
          isAutoReply.isAcceptableOrUnknown(
              data['isAutoReply'], _isAutoReplyMeta));
    }
    if (data.containsKey('isSystemMessage')) {
      context.handle(
          _isSystemMessageMeta,
          isSystemMessage.isAcceptableOrUnknown(
              data['isSystemMessage'], _isSystemMessageMeta));
    }
    if (data.containsKey('isServiceMessage')) {
      context.handle(
          _isServiceMessageMeta,
          isServiceMessage.isAcceptableOrUnknown(
              data['isServiceMessage'], _isServiceMessageMeta));
    }
    if (data.containsKey('isForward')) {
      context.handle(_isForwardMeta,
          isForward.isAcceptableOrUnknown(data['isForward'], _isForwardMeta));
    }
    if (data.containsKey('isArchived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['isArchived'], _isArchivedMeta));
    }
    if (data.containsKey('cacheRoomnames')) {
      context.handle(
          _cacheRoomnamesMeta,
          cacheRoomnames.isAcceptableOrUnknown(
              data['cacheRoomnames'], _cacheRoomnamesMeta));
    }
    if (data.containsKey('isAudioMessage')) {
      context.handle(
          _isAudioMessageMeta,
          isAudioMessage.isAcceptableOrUnknown(
              data['isAudioMessage'], _isAudioMessageMeta));
    }
    if (data.containsKey('datePlayed')) {
      context.handle(
          _datePlayedMeta,
          datePlayed.isAcceptableOrUnknown(
              data['datePlayed'], _datePlayedMeta));
    }
    if (data.containsKey('itemType')) {
      context.handle(_itemTypeMeta,
          itemType.isAcceptableOrUnknown(data['itemType'], _itemTypeMeta));
    }
    if (data.containsKey('groupTitle')) {
      context.handle(
          _groupTitleMeta,
          groupTitle.isAcceptableOrUnknown(
              data['groupTitle'], _groupTitleMeta));
    }
    if (data.containsKey('groupActionType')) {
      context.handle(
          _groupActionTypeMeta,
          groupActionType.isAcceptableOrUnknown(
              data['groupActionType'], _groupActionTypeMeta));
    }
    if (data.containsKey('isExpired')) {
      context.handle(_isExpiredMeta,
          isExpired.isAcceptableOrUnknown(data['isExpired'], _isExpiredMeta));
    }
    if (data.containsKey('associatedMessageGuid')) {
      context.handle(
          _associatedMessageGuidMeta,
          associatedMessageGuid.isAcceptableOrUnknown(
              data['associatedMessageGuid'], _associatedMessageGuidMeta));
    }
    if (data.containsKey('associatedMessageType')) {
      context.handle(
          _associatedMessageTypeMeta,
          associatedMessageType.isAcceptableOrUnknown(
              data['associatedMessageType'], _associatedMessageTypeMeta));
    }
    if (data.containsKey('expressiveSendStyleId')) {
      context.handle(
          _expressiveSendStyleIdMeta,
          expressiveSendStyleId.isAcceptableOrUnknown(
              data['expressiveSendStyleId'], _expressiveSendStyleIdMeta));
    }
    if (data.containsKey('timeExpressiveSendStyleId')) {
      context.handle(
          _timeExpressiveSendStyleIdMeta,
          timeExpressiveSendStyleId.isAcceptableOrUnknown(
              data['timeExpressiveSendStyleId'],
              _timeExpressiveSendStyleIdMeta));
    }
    if (data.containsKey('hasAttachments')) {
      context.handle(
          _hasAttachmentsMeta,
          hasAttachments.isAcceptableOrUnknown(
              data['hasAttachments'], _hasAttachmentsMeta));
    }
    if (data.containsKey('hasReactions')) {
      context.handle(
          _hasReactionsMeta,
          hasReactions.isAcceptableOrUnknown(
              data['hasReactions'], _hasReactionsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MessageEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MessageTableTable createAlias(String alias) {
    return $MessageTableTable(_db, alias);
  }
}

class ChatEntity extends DataClass implements Insertable<ChatEntity> {
  final int id;
  final String guid;
  final int style;
  final String chatIdentifier;
  final bool isArchived;
  final bool isMuted;
  final bool hasUnreadMessage;
  final DateTime latestMessageDate;
  final String latestMessageText;
  final String displayName;
  ChatEntity(
      {@required this.id,
      @required this.guid,
      @required this.style,
      @required this.chatIdentifier,
      @required this.isArchived,
      @required this.isMuted,
      @required this.hasUnreadMessage,
      this.latestMessageDate,
      this.latestMessageText,
      this.displayName});
  factory ChatEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ChatEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      style: intType.mapFromDatabaseResponse(data['${effectivePrefix}style']),
      chatIdentifier: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chatIdentifier']),
      isArchived: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isArchived']),
      isMuted:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isMuted']),
      hasUnreadMessage: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}hasUnreadMessage']),
      latestMessageDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}latestMessageDate']),
      latestMessageText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}latestMessageText']),
      displayName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}displayName']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || style != null) {
      map['style'] = Variable<int>(style);
    }
    if (!nullToAbsent || chatIdentifier != null) {
      map['chatIdentifier'] = Variable<String>(chatIdentifier);
    }
    if (!nullToAbsent || isArchived != null) {
      map['isArchived'] = Variable<bool>(isArchived);
    }
    if (!nullToAbsent || isMuted != null) {
      map['isMuted'] = Variable<bool>(isMuted);
    }
    if (!nullToAbsent || hasUnreadMessage != null) {
      map['hasUnreadMessage'] = Variable<bool>(hasUnreadMessage);
    }
    if (!nullToAbsent || latestMessageDate != null) {
      map['latestMessageDate'] = Variable<DateTime>(latestMessageDate);
    }
    if (!nullToAbsent || latestMessageText != null) {
      map['latestMessageText'] = Variable<String>(latestMessageText);
    }
    if (!nullToAbsent || displayName != null) {
      map['displayName'] = Variable<String>(displayName);
    }
    return map;
  }

  ChatTableCompanion toCompanion(bool nullToAbsent) {
    return ChatTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      style:
          style == null && nullToAbsent ? const Value.absent() : Value(style),
      chatIdentifier: chatIdentifier == null && nullToAbsent
          ? const Value.absent()
          : Value(chatIdentifier),
      isArchived: isArchived == null && nullToAbsent
          ? const Value.absent()
          : Value(isArchived),
      isMuted: isMuted == null && nullToAbsent
          ? const Value.absent()
          : Value(isMuted),
      hasUnreadMessage: hasUnreadMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(hasUnreadMessage),
      latestMessageDate: latestMessageDate == null && nullToAbsent
          ? const Value.absent()
          : Value(latestMessageDate),
      latestMessageText: latestMessageText == null && nullToAbsent
          ? const Value.absent()
          : Value(latestMessageText),
      displayName: displayName == null && nullToAbsent
          ? const Value.absent()
          : Value(displayName),
    );
  }

  factory ChatEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatEntity(
      id: serializer.fromJson<int>(json['ROWID']),
      guid: serializer.fromJson<String>(json['guid']),
      style: serializer.fromJson<int>(json['style']),
      chatIdentifier: serializer.fromJson<String>(json['chatIdentifier']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      isMuted: serializer.fromJson<bool>(json['isMuted']),
      hasUnreadMessage: serializer.fromJson<bool>(json['hasUnreadMessage']),
      latestMessageDate:
          serializer.fromJson<DateTime>(json['latestMessageDate']),
      latestMessageText: serializer.fromJson<String>(json['latestMessageText']),
      displayName: serializer.fromJson<String>(json['displayName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ROWID': serializer.toJson<int>(id),
      'guid': serializer.toJson<String>(guid),
      'style': serializer.toJson<int>(style),
      'chatIdentifier': serializer.toJson<String>(chatIdentifier),
      'isArchived': serializer.toJson<bool>(isArchived),
      'isMuted': serializer.toJson<bool>(isMuted),
      'hasUnreadMessage': serializer.toJson<bool>(hasUnreadMessage),
      'latestMessageDate': serializer.toJson<DateTime>(latestMessageDate),
      'latestMessageText': serializer.toJson<String>(latestMessageText),
      'displayName': serializer.toJson<String>(displayName),
    };
  }

  ChatEntity copyWith(
          {int id,
          String guid,
          int style,
          String chatIdentifier,
          bool isArchived,
          bool isMuted,
          bool hasUnreadMessage,
          DateTime latestMessageDate,
          String latestMessageText,
          String displayName}) =>
      ChatEntity(
        id: id ?? this.id,
        guid: guid ?? this.guid,
        style: style ?? this.style,
        chatIdentifier: chatIdentifier ?? this.chatIdentifier,
        isArchived: isArchived ?? this.isArchived,
        isMuted: isMuted ?? this.isMuted,
        hasUnreadMessage: hasUnreadMessage ?? this.hasUnreadMessage,
        latestMessageDate: latestMessageDate ?? this.latestMessageDate,
        latestMessageText: latestMessageText ?? this.latestMessageText,
        displayName: displayName ?? this.displayName,
      );
  @override
  String toString() {
    return (StringBuffer('ChatEntity(')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('style: $style, ')
          ..write('chatIdentifier: $chatIdentifier, ')
          ..write('isArchived: $isArchived, ')
          ..write('isMuted: $isMuted, ')
          ..write('hasUnreadMessage: $hasUnreadMessage, ')
          ..write('latestMessageDate: $latestMessageDate, ')
          ..write('latestMessageText: $latestMessageText, ')
          ..write('displayName: $displayName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          guid.hashCode,
          $mrjc(
              style.hashCode,
              $mrjc(
                  chatIdentifier.hashCode,
                  $mrjc(
                      isArchived.hashCode,
                      $mrjc(
                          isMuted.hashCode,
                          $mrjc(
                              hasUnreadMessage.hashCode,
                              $mrjc(
                                  latestMessageDate.hashCode,
                                  $mrjc(latestMessageText.hashCode,
                                      displayName.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatEntity &&
          other.id == this.id &&
          other.guid == this.guid &&
          other.style == this.style &&
          other.chatIdentifier == this.chatIdentifier &&
          other.isArchived == this.isArchived &&
          other.isMuted == this.isMuted &&
          other.hasUnreadMessage == this.hasUnreadMessage &&
          other.latestMessageDate == this.latestMessageDate &&
          other.latestMessageText == this.latestMessageText &&
          other.displayName == this.displayName);
}

class ChatTableCompanion extends UpdateCompanion<ChatEntity> {
  final Value<int> id;
  final Value<String> guid;
  final Value<int> style;
  final Value<String> chatIdentifier;
  final Value<bool> isArchived;
  final Value<bool> isMuted;
  final Value<bool> hasUnreadMessage;
  final Value<DateTime> latestMessageDate;
  final Value<String> latestMessageText;
  final Value<String> displayName;
  const ChatTableCompanion({
    this.id = const Value.absent(),
    this.guid = const Value.absent(),
    this.style = const Value.absent(),
    this.chatIdentifier = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.isMuted = const Value.absent(),
    this.hasUnreadMessage = const Value.absent(),
    this.latestMessageDate = const Value.absent(),
    this.latestMessageText = const Value.absent(),
    this.displayName = const Value.absent(),
  });
  ChatTableCompanion.insert({
    this.id = const Value.absent(),
    @required String guid,
    @required int style,
    @required String chatIdentifier,
    this.isArchived = const Value.absent(),
    this.isMuted = const Value.absent(),
    this.hasUnreadMessage = const Value.absent(),
    this.latestMessageDate = const Value.absent(),
    this.latestMessageText = const Value.absent(),
    this.displayName = const Value.absent(),
  })  : guid = Value(guid),
        style = Value(style),
        chatIdentifier = Value(chatIdentifier);
  static Insertable<ChatEntity> custom({
    Expression<int> id,
    Expression<String> guid,
    Expression<int> style,
    Expression<String> chatIdentifier,
    Expression<bool> isArchived,
    Expression<bool> isMuted,
    Expression<bool> hasUnreadMessage,
    Expression<DateTime> latestMessageDate,
    Expression<String> latestMessageText,
    Expression<String> displayName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guid != null) 'guid': guid,
      if (style != null) 'style': style,
      if (chatIdentifier != null) 'chatIdentifier': chatIdentifier,
      if (isArchived != null) 'isArchived': isArchived,
      if (isMuted != null) 'isMuted': isMuted,
      if (hasUnreadMessage != null) 'hasUnreadMessage': hasUnreadMessage,
      if (latestMessageDate != null) 'latestMessageDate': latestMessageDate,
      if (latestMessageText != null) 'latestMessageText': latestMessageText,
      if (displayName != null) 'displayName': displayName,
    });
  }

  ChatTableCompanion copyWith(
      {Value<int> id,
      Value<String> guid,
      Value<int> style,
      Value<String> chatIdentifier,
      Value<bool> isArchived,
      Value<bool> isMuted,
      Value<bool> hasUnreadMessage,
      Value<DateTime> latestMessageDate,
      Value<String> latestMessageText,
      Value<String> displayName}) {
    return ChatTableCompanion(
      id: id ?? this.id,
      guid: guid ?? this.guid,
      style: style ?? this.style,
      chatIdentifier: chatIdentifier ?? this.chatIdentifier,
      isArchived: isArchived ?? this.isArchived,
      isMuted: isMuted ?? this.isMuted,
      hasUnreadMessage: hasUnreadMessage ?? this.hasUnreadMessage,
      latestMessageDate: latestMessageDate ?? this.latestMessageDate,
      latestMessageText: latestMessageText ?? this.latestMessageText,
      displayName: displayName ?? this.displayName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (style.present) {
      map['style'] = Variable<int>(style.value);
    }
    if (chatIdentifier.present) {
      map['chatIdentifier'] = Variable<String>(chatIdentifier.value);
    }
    if (isArchived.present) {
      map['isArchived'] = Variable<bool>(isArchived.value);
    }
    if (isMuted.present) {
      map['isMuted'] = Variable<bool>(isMuted.value);
    }
    if (hasUnreadMessage.present) {
      map['hasUnreadMessage'] = Variable<bool>(hasUnreadMessage.value);
    }
    if (latestMessageDate.present) {
      map['latestMessageDate'] = Variable<DateTime>(latestMessageDate.value);
    }
    if (latestMessageText.present) {
      map['latestMessageText'] = Variable<String>(latestMessageText.value);
    }
    if (displayName.present) {
      map['displayName'] = Variable<String>(displayName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatTableCompanion(')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('style: $style, ')
          ..write('chatIdentifier: $chatIdentifier, ')
          ..write('isArchived: $isArchived, ')
          ..write('isMuted: $isMuted, ')
          ..write('hasUnreadMessage: $hasUnreadMessage, ')
          ..write('latestMessageDate: $latestMessageDate, ')
          ..write('latestMessageText: $latestMessageText, ')
          ..write('displayName: $displayName')
          ..write(')'))
        .toString();
  }
}

class $ChatTableTable extends ChatTable
    with TableInfo<$ChatTableTable, ChatEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChatTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn(
      'guid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _styleMeta = const VerificationMeta('style');
  GeneratedIntColumn _style;
  @override
  GeneratedIntColumn get style => _style ??= _constructStyle();
  GeneratedIntColumn _constructStyle() {
    return GeneratedIntColumn(
      'style',
      $tableName,
      false,
    );
  }

  final VerificationMeta _chatIdentifierMeta =
      const VerificationMeta('chatIdentifier');
  GeneratedTextColumn _chatIdentifier;
  @override
  GeneratedTextColumn get chatIdentifier =>
      _chatIdentifier ??= _constructChatIdentifier();
  GeneratedTextColumn _constructChatIdentifier() {
    return GeneratedTextColumn(
      'chatIdentifier',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isArchivedMeta = const VerificationMeta('isArchived');
  GeneratedBoolColumn _isArchived;
  @override
  GeneratedBoolColumn get isArchived => _isArchived ??= _constructIsArchived();
  GeneratedBoolColumn _constructIsArchived() {
    return GeneratedBoolColumn('isArchived', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _isMutedMeta = const VerificationMeta('isMuted');
  GeneratedBoolColumn _isMuted;
  @override
  GeneratedBoolColumn get isMuted => _isMuted ??= _constructIsMuted();
  GeneratedBoolColumn _constructIsMuted() {
    return GeneratedBoolColumn('isMuted', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _hasUnreadMessageMeta =
      const VerificationMeta('hasUnreadMessage');
  GeneratedBoolColumn _hasUnreadMessage;
  @override
  GeneratedBoolColumn get hasUnreadMessage =>
      _hasUnreadMessage ??= _constructHasUnreadMessage();
  GeneratedBoolColumn _constructHasUnreadMessage() {
    return GeneratedBoolColumn('hasUnreadMessage', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _latestMessageDateMeta =
      const VerificationMeta('latestMessageDate');
  GeneratedDateTimeColumn _latestMessageDate;
  @override
  GeneratedDateTimeColumn get latestMessageDate =>
      _latestMessageDate ??= _constructLatestMessageDate();
  GeneratedDateTimeColumn _constructLatestMessageDate() {
    return GeneratedDateTimeColumn('latestMessageDate', $tableName, true,
        defaultValue: const Constant(null));
  }

  final VerificationMeta _latestMessageTextMeta =
      const VerificationMeta('latestMessageText');
  GeneratedTextColumn _latestMessageText;
  @override
  GeneratedTextColumn get latestMessageText =>
      _latestMessageText ??= _constructLatestMessageText();
  GeneratedTextColumn _constructLatestMessageText() {
    return GeneratedTextColumn(
      'latestMessageText',
      $tableName,
      true,
    );
  }

  final VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  GeneratedTextColumn _displayName;
  @override
  GeneratedTextColumn get displayName =>
      _displayName ??= _constructDisplayName();
  GeneratedTextColumn _constructDisplayName() {
    return GeneratedTextColumn(
      'displayName',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        guid,
        style,
        chatIdentifier,
        isArchived,
        isMuted,
        hasUnreadMessage,
        latestMessageDate,
        latestMessageText,
        displayName
      ];
  @override
  $ChatTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chat';
  @override
  final String actualTableName = 'chat';
  @override
  VerificationContext validateIntegrity(Insertable<ChatEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style'], _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (data.containsKey('chatIdentifier')) {
      context.handle(
          _chatIdentifierMeta,
          chatIdentifier.isAcceptableOrUnknown(
              data['chatIdentifier'], _chatIdentifierMeta));
    } else if (isInserting) {
      context.missing(_chatIdentifierMeta);
    }
    if (data.containsKey('isArchived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['isArchived'], _isArchivedMeta));
    }
    if (data.containsKey('isMuted')) {
      context.handle(_isMutedMeta,
          isMuted.isAcceptableOrUnknown(data['isMuted'], _isMutedMeta));
    }
    if (data.containsKey('hasUnreadMessage')) {
      context.handle(
          _hasUnreadMessageMeta,
          hasUnreadMessage.isAcceptableOrUnknown(
              data['hasUnreadMessage'], _hasUnreadMessageMeta));
    }
    if (data.containsKey('latestMessageDate')) {
      context.handle(
          _latestMessageDateMeta,
          latestMessageDate.isAcceptableOrUnknown(
              data['latestMessageDate'], _latestMessageDateMeta));
    }
    if (data.containsKey('latestMessageText')) {
      context.handle(
          _latestMessageTextMeta,
          latestMessageText.isAcceptableOrUnknown(
              data['latestMessageText'], _latestMessageTextMeta));
    }
    if (data.containsKey('displayName')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['displayName'], _displayNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChatEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ChatTableTable createAlias(String alias) {
    return $ChatTableTable(_db, alias);
  }
}

class HandleEntity extends DataClass implements Insertable<HandleEntity> {
  final int id;
  final String address;
  final String country;
  final String uncanonicalizedId;
  HandleEntity(
      {@required this.id,
      @required this.address,
      this.country,
      this.uncanonicalizedId});
  factory HandleEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return HandleEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      uncanonicalizedId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}uncanonicalizedId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || uncanonicalizedId != null) {
      map['uncanonicalizedId'] = Variable<String>(uncanonicalizedId);
    }
    return map;
  }

  HandleTableCompanion toCompanion(bool nullToAbsent) {
    return HandleTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      uncanonicalizedId: uncanonicalizedId == null && nullToAbsent
          ? const Value.absent()
          : Value(uncanonicalizedId),
    );
  }

  factory HandleEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return HandleEntity(
      id: serializer.fromJson<int>(json['ROWID']),
      address: serializer.fromJson<String>(json['address']),
      country: serializer.fromJson<String>(json['country']),
      uncanonicalizedId: serializer.fromJson<String>(json['uncanonicalizedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ROWID': serializer.toJson<int>(id),
      'address': serializer.toJson<String>(address),
      'country': serializer.toJson<String>(country),
      'uncanonicalizedId': serializer.toJson<String>(uncanonicalizedId),
    };
  }

  HandleEntity copyWith(
          {int id, String address, String country, String uncanonicalizedId}) =>
      HandleEntity(
        id: id ?? this.id,
        address: address ?? this.address,
        country: country ?? this.country,
        uncanonicalizedId: uncanonicalizedId ?? this.uncanonicalizedId,
      );
  @override
  String toString() {
    return (StringBuffer('HandleEntity(')
          ..write('id: $id, ')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('uncanonicalizedId: $uncanonicalizedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(address.hashCode,
          $mrjc(country.hashCode, uncanonicalizedId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is HandleEntity &&
          other.id == this.id &&
          other.address == this.address &&
          other.country == this.country &&
          other.uncanonicalizedId == this.uncanonicalizedId);
}

class HandleTableCompanion extends UpdateCompanion<HandleEntity> {
  final Value<int> id;
  final Value<String> address;
  final Value<String> country;
  final Value<String> uncanonicalizedId;
  const HandleTableCompanion({
    this.id = const Value.absent(),
    this.address = const Value.absent(),
    this.country = const Value.absent(),
    this.uncanonicalizedId = const Value.absent(),
  });
  HandleTableCompanion.insert({
    this.id = const Value.absent(),
    @required String address,
    this.country = const Value.absent(),
    this.uncanonicalizedId = const Value.absent(),
  }) : address = Value(address);
  static Insertable<HandleEntity> custom({
    Expression<int> id,
    Expression<String> address,
    Expression<String> country,
    Expression<String> uncanonicalizedId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (address != null) 'address': address,
      if (country != null) 'country': country,
      if (uncanonicalizedId != null) 'uncanonicalizedId': uncanonicalizedId,
    });
  }

  HandleTableCompanion copyWith(
      {Value<int> id,
      Value<String> address,
      Value<String> country,
      Value<String> uncanonicalizedId}) {
    return HandleTableCompanion(
      id: id ?? this.id,
      address: address ?? this.address,
      country: country ?? this.country,
      uncanonicalizedId: uncanonicalizedId ?? this.uncanonicalizedId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (uncanonicalizedId.present) {
      map['uncanonicalizedId'] = Variable<String>(uncanonicalizedId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HandleTableCompanion(')
          ..write('id: $id, ')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('uncanonicalizedId: $uncanonicalizedId')
          ..write(')'))
        .toString();
  }
}

class $HandleTableTable extends HandleTable
    with TableInfo<$HandleTableTable, HandleEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $HandleTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      true,
    );
  }

  final VerificationMeta _uncanonicalizedIdMeta =
      const VerificationMeta('uncanonicalizedId');
  GeneratedTextColumn _uncanonicalizedId;
  @override
  GeneratedTextColumn get uncanonicalizedId =>
      _uncanonicalizedId ??= _constructUncanonicalizedId();
  GeneratedTextColumn _constructUncanonicalizedId() {
    return GeneratedTextColumn(
      'uncanonicalizedId',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, address, country, uncanonicalizedId];
  @override
  $HandleTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'handle';
  @override
  final String actualTableName = 'handle';
  @override
  VerificationContext validateIntegrity(Insertable<HandleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country'], _countryMeta));
    }
    if (data.containsKey('uncanonicalizedId')) {
      context.handle(
          _uncanonicalizedIdMeta,
          uncanonicalizedId.isAcceptableOrUnknown(
              data['uncanonicalizedId'], _uncanonicalizedIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HandleEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return HandleEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $HandleTableTable createAlias(String alias) {
    return $HandleTableTable(_db, alias);
  }
}

class AttachmentEntity extends DataClass
    implements Insertable<AttachmentEntity> {
  final int id;
  final String guid;
  final String uti;
  final String mimeType;
  final int transferState;
  final bool isOutgoing;
  final String transferName;
  final int totalBytes;
  final bool isSticker;
  final bool hideAttachments;
  final String blurhash;
  final int height;
  final int width;
  AttachmentEntity(
      {@required this.id,
      @required this.guid,
      @required this.uti,
      this.mimeType,
      @required this.transferState,
      @required this.isOutgoing,
      @required this.transferName,
      @required this.totalBytes,
      @required this.isSticker,
      @required this.hideAttachments,
      this.blurhash,
      this.height,
      this.width});
  factory AttachmentEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return AttachmentEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      uti: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uti']),
      mimeType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mimeType']),
      transferState: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}transferState']),
      isOutgoing: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}isOutgoing']),
      transferName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}transferName']),
      totalBytes:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}totalBytes']),
      isSticker:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}isSticker']),
      hideAttachments: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}hideAttachments']),
      blurhash: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}blurhash']),
      height: intType.mapFromDatabaseResponse(data['${effectivePrefix}height']),
      width: intType.mapFromDatabaseResponse(data['${effectivePrefix}width']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || guid != null) {
      map['guid'] = Variable<String>(guid);
    }
    if (!nullToAbsent || uti != null) {
      map['uti'] = Variable<String>(uti);
    }
    if (!nullToAbsent || mimeType != null) {
      map['mimeType'] = Variable<String>(mimeType);
    }
    if (!nullToAbsent || transferState != null) {
      map['transferState'] = Variable<int>(transferState);
    }
    if (!nullToAbsent || isOutgoing != null) {
      map['isOutgoing'] = Variable<bool>(isOutgoing);
    }
    if (!nullToAbsent || transferName != null) {
      map['transferName'] = Variable<String>(transferName);
    }
    if (!nullToAbsent || totalBytes != null) {
      map['totalBytes'] = Variable<int>(totalBytes);
    }
    if (!nullToAbsent || isSticker != null) {
      map['isSticker'] = Variable<bool>(isSticker);
    }
    if (!nullToAbsent || hideAttachments != null) {
      map['hideAttachments'] = Variable<bool>(hideAttachments);
    }
    if (!nullToAbsent || blurhash != null) {
      map['blurhash'] = Variable<String>(blurhash);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    return map;
  }

  AttachmentTableCompanion toCompanion(bool nullToAbsent) {
    return AttachmentTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      guid: guid == null && nullToAbsent ? const Value.absent() : Value(guid),
      uti: uti == null && nullToAbsent ? const Value.absent() : Value(uti),
      mimeType: mimeType == null && nullToAbsent
          ? const Value.absent()
          : Value(mimeType),
      transferState: transferState == null && nullToAbsent
          ? const Value.absent()
          : Value(transferState),
      isOutgoing: isOutgoing == null && nullToAbsent
          ? const Value.absent()
          : Value(isOutgoing),
      transferName: transferName == null && nullToAbsent
          ? const Value.absent()
          : Value(transferName),
      totalBytes: totalBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(totalBytes),
      isSticker: isSticker == null && nullToAbsent
          ? const Value.absent()
          : Value(isSticker),
      hideAttachments: hideAttachments == null && nullToAbsent
          ? const Value.absent()
          : Value(hideAttachments),
      blurhash: blurhash == null && nullToAbsent
          ? const Value.absent()
          : Value(blurhash),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      width:
          width == null && nullToAbsent ? const Value.absent() : Value(width),
    );
  }

  factory AttachmentEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AttachmentEntity(
      id: serializer.fromJson<int>(json['ROWID']),
      guid: serializer.fromJson<String>(json['guid']),
      uti: serializer.fromJson<String>(json['uti']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      transferState: serializer.fromJson<int>(json['transferState']),
      isOutgoing: serializer.fromJson<bool>(json['isOutgoing']),
      transferName: serializer.fromJson<String>(json['transferName']),
      totalBytes: serializer.fromJson<int>(json['totalBytes']),
      isSticker: serializer.fromJson<bool>(json['isSticker']),
      hideAttachments: serializer.fromJson<bool>(json['hideAttachments']),
      blurhash: serializer.fromJson<String>(json['blurhash']),
      height: serializer.fromJson<int>(json['height']),
      width: serializer.fromJson<int>(json['width']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ROWID': serializer.toJson<int>(id),
      'guid': serializer.toJson<String>(guid),
      'uti': serializer.toJson<String>(uti),
      'mimeType': serializer.toJson<String>(mimeType),
      'transferState': serializer.toJson<int>(transferState),
      'isOutgoing': serializer.toJson<bool>(isOutgoing),
      'transferName': serializer.toJson<String>(transferName),
      'totalBytes': serializer.toJson<int>(totalBytes),
      'isSticker': serializer.toJson<bool>(isSticker),
      'hideAttachments': serializer.toJson<bool>(hideAttachments),
      'blurhash': serializer.toJson<String>(blurhash),
      'height': serializer.toJson<int>(height),
      'width': serializer.toJson<int>(width),
    };
  }

  AttachmentEntity copyWith(
          {int id,
          String guid,
          String uti,
          String mimeType,
          int transferState,
          bool isOutgoing,
          String transferName,
          int totalBytes,
          bool isSticker,
          bool hideAttachments,
          String blurhash,
          int height,
          int width}) =>
      AttachmentEntity(
        id: id ?? this.id,
        guid: guid ?? this.guid,
        uti: uti ?? this.uti,
        mimeType: mimeType ?? this.mimeType,
        transferState: transferState ?? this.transferState,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        transferName: transferName ?? this.transferName,
        totalBytes: totalBytes ?? this.totalBytes,
        isSticker: isSticker ?? this.isSticker,
        hideAttachments: hideAttachments ?? this.hideAttachments,
        blurhash: blurhash ?? this.blurhash,
        height: height ?? this.height,
        width: width ?? this.width,
      );
  @override
  String toString() {
    return (StringBuffer('AttachmentEntity(')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('uti: $uti, ')
          ..write('mimeType: $mimeType, ')
          ..write('transferState: $transferState, ')
          ..write('isOutgoing: $isOutgoing, ')
          ..write('transferName: $transferName, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('isSticker: $isSticker, ')
          ..write('hideAttachments: $hideAttachments, ')
          ..write('blurhash: $blurhash, ')
          ..write('height: $height, ')
          ..write('width: $width')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          guid.hashCode,
          $mrjc(
              uti.hashCode,
              $mrjc(
                  mimeType.hashCode,
                  $mrjc(
                      transferState.hashCode,
                      $mrjc(
                          isOutgoing.hashCode,
                          $mrjc(
                              transferName.hashCode,
                              $mrjc(
                                  totalBytes.hashCode,
                                  $mrjc(
                                      isSticker.hashCode,
                                      $mrjc(
                                          hideAttachments.hashCode,
                                          $mrjc(
                                              blurhash.hashCode,
                                              $mrjc(height.hashCode,
                                                  width.hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AttachmentEntity &&
          other.id == this.id &&
          other.guid == this.guid &&
          other.uti == this.uti &&
          other.mimeType == this.mimeType &&
          other.transferState == this.transferState &&
          other.isOutgoing == this.isOutgoing &&
          other.transferName == this.transferName &&
          other.totalBytes == this.totalBytes &&
          other.isSticker == this.isSticker &&
          other.hideAttachments == this.hideAttachments &&
          other.blurhash == this.blurhash &&
          other.height == this.height &&
          other.width == this.width);
}

class AttachmentTableCompanion extends UpdateCompanion<AttachmentEntity> {
  final Value<int> id;
  final Value<String> guid;
  final Value<String> uti;
  final Value<String> mimeType;
  final Value<int> transferState;
  final Value<bool> isOutgoing;
  final Value<String> transferName;
  final Value<int> totalBytes;
  final Value<bool> isSticker;
  final Value<bool> hideAttachments;
  final Value<String> blurhash;
  final Value<int> height;
  final Value<int> width;
  const AttachmentTableCompanion({
    this.id = const Value.absent(),
    this.guid = const Value.absent(),
    this.uti = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.transferState = const Value.absent(),
    this.isOutgoing = const Value.absent(),
    this.transferName = const Value.absent(),
    this.totalBytes = const Value.absent(),
    this.isSticker = const Value.absent(),
    this.hideAttachments = const Value.absent(),
    this.blurhash = const Value.absent(),
    this.height = const Value.absent(),
    this.width = const Value.absent(),
  });
  AttachmentTableCompanion.insert({
    this.id = const Value.absent(),
    @required String guid,
    @required String uti,
    this.mimeType = const Value.absent(),
    this.transferState = const Value.absent(),
    this.isOutgoing = const Value.absent(),
    @required String transferName,
    @required int totalBytes,
    this.isSticker = const Value.absent(),
    this.hideAttachments = const Value.absent(),
    this.blurhash = const Value.absent(),
    this.height = const Value.absent(),
    this.width = const Value.absent(),
  })  : guid = Value(guid),
        uti = Value(uti),
        transferName = Value(transferName),
        totalBytes = Value(totalBytes);
  static Insertable<AttachmentEntity> custom({
    Expression<int> id,
    Expression<String> guid,
    Expression<String> uti,
    Expression<String> mimeType,
    Expression<int> transferState,
    Expression<bool> isOutgoing,
    Expression<String> transferName,
    Expression<int> totalBytes,
    Expression<bool> isSticker,
    Expression<bool> hideAttachments,
    Expression<String> blurhash,
    Expression<int> height,
    Expression<int> width,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guid != null) 'guid': guid,
      if (uti != null) 'uti': uti,
      if (mimeType != null) 'mimeType': mimeType,
      if (transferState != null) 'transferState': transferState,
      if (isOutgoing != null) 'isOutgoing': isOutgoing,
      if (transferName != null) 'transferName': transferName,
      if (totalBytes != null) 'totalBytes': totalBytes,
      if (isSticker != null) 'isSticker': isSticker,
      if (hideAttachments != null) 'hideAttachments': hideAttachments,
      if (blurhash != null) 'blurhash': blurhash,
      if (height != null) 'height': height,
      if (width != null) 'width': width,
    });
  }

  AttachmentTableCompanion copyWith(
      {Value<int> id,
      Value<String> guid,
      Value<String> uti,
      Value<String> mimeType,
      Value<int> transferState,
      Value<bool> isOutgoing,
      Value<String> transferName,
      Value<int> totalBytes,
      Value<bool> isSticker,
      Value<bool> hideAttachments,
      Value<String> blurhash,
      Value<int> height,
      Value<int> width}) {
    return AttachmentTableCompanion(
      id: id ?? this.id,
      guid: guid ?? this.guid,
      uti: uti ?? this.uti,
      mimeType: mimeType ?? this.mimeType,
      transferState: transferState ?? this.transferState,
      isOutgoing: isOutgoing ?? this.isOutgoing,
      transferName: transferName ?? this.transferName,
      totalBytes: totalBytes ?? this.totalBytes,
      isSticker: isSticker ?? this.isSticker,
      hideAttachments: hideAttachments ?? this.hideAttachments,
      blurhash: blurhash ?? this.blurhash,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (guid.present) {
      map['guid'] = Variable<String>(guid.value);
    }
    if (uti.present) {
      map['uti'] = Variable<String>(uti.value);
    }
    if (mimeType.present) {
      map['mimeType'] = Variable<String>(mimeType.value);
    }
    if (transferState.present) {
      map['transferState'] = Variable<int>(transferState.value);
    }
    if (isOutgoing.present) {
      map['isOutgoing'] = Variable<bool>(isOutgoing.value);
    }
    if (transferName.present) {
      map['transferName'] = Variable<String>(transferName.value);
    }
    if (totalBytes.present) {
      map['totalBytes'] = Variable<int>(totalBytes.value);
    }
    if (isSticker.present) {
      map['isSticker'] = Variable<bool>(isSticker.value);
    }
    if (hideAttachments.present) {
      map['hideAttachments'] = Variable<bool>(hideAttachments.value);
    }
    if (blurhash.present) {
      map['blurhash'] = Variable<String>(blurhash.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentTableCompanion(')
          ..write('id: $id, ')
          ..write('guid: $guid, ')
          ..write('uti: $uti, ')
          ..write('mimeType: $mimeType, ')
          ..write('transferState: $transferState, ')
          ..write('isOutgoing: $isOutgoing, ')
          ..write('transferName: $transferName, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('isSticker: $isSticker, ')
          ..write('hideAttachments: $hideAttachments, ')
          ..write('blurhash: $blurhash, ')
          ..write('height: $height, ')
          ..write('width: $width')
          ..write(')'))
        .toString();
  }
}

class $AttachmentTableTable extends AttachmentTable
    with TableInfo<$AttachmentTableTable, AttachmentEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $AttachmentTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  @override
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn(
      'guid',
      $tableName,
      false,
    );
  }

  final VerificationMeta _utiMeta = const VerificationMeta('uti');
  GeneratedTextColumn _uti;
  @override
  GeneratedTextColumn get uti => _uti ??= _constructUti();
  GeneratedTextColumn _constructUti() {
    return GeneratedTextColumn(
      'uti',
      $tableName,
      false,
    );
  }

  final VerificationMeta _mimeTypeMeta = const VerificationMeta('mimeType');
  GeneratedTextColumn _mimeType;
  @override
  GeneratedTextColumn get mimeType => _mimeType ??= _constructMimeType();
  GeneratedTextColumn _constructMimeType() {
    return GeneratedTextColumn(
      'mimeType',
      $tableName,
      true,
    );
  }

  final VerificationMeta _transferStateMeta =
      const VerificationMeta('transferState');
  GeneratedIntColumn _transferState;
  @override
  GeneratedIntColumn get transferState =>
      _transferState ??= _constructTransferState();
  GeneratedIntColumn _constructTransferState() {
    return GeneratedIntColumn('transferState', $tableName, false,
        defaultValue: const Constant(0));
  }

  final VerificationMeta _isOutgoingMeta = const VerificationMeta('isOutgoing');
  GeneratedBoolColumn _isOutgoing;
  @override
  GeneratedBoolColumn get isOutgoing => _isOutgoing ??= _constructIsOutgoing();
  GeneratedBoolColumn _constructIsOutgoing() {
    return GeneratedBoolColumn('isOutgoing', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _transferNameMeta =
      const VerificationMeta('transferName');
  GeneratedTextColumn _transferName;
  @override
  GeneratedTextColumn get transferName =>
      _transferName ??= _constructTransferName();
  GeneratedTextColumn _constructTransferName() {
    return GeneratedTextColumn(
      'transferName',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalBytesMeta = const VerificationMeta('totalBytes');
  GeneratedIntColumn _totalBytes;
  @override
  GeneratedIntColumn get totalBytes => _totalBytes ??= _constructTotalBytes();
  GeneratedIntColumn _constructTotalBytes() {
    return GeneratedIntColumn(
      'totalBytes',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isStickerMeta = const VerificationMeta('isSticker');
  GeneratedBoolColumn _isSticker;
  @override
  GeneratedBoolColumn get isSticker => _isSticker ??= _constructIsSticker();
  GeneratedBoolColumn _constructIsSticker() {
    return GeneratedBoolColumn('isSticker', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _hideAttachmentsMeta =
      const VerificationMeta('hideAttachments');
  GeneratedBoolColumn _hideAttachments;
  @override
  GeneratedBoolColumn get hideAttachments =>
      _hideAttachments ??= _constructHideAttachments();
  GeneratedBoolColumn _constructHideAttachments() {
    return GeneratedBoolColumn('hideAttachments', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _blurhashMeta = const VerificationMeta('blurhash');
  GeneratedTextColumn _blurhash;
  @override
  GeneratedTextColumn get blurhash => _blurhash ??= _constructBlurhash();
  GeneratedTextColumn _constructBlurhash() {
    return GeneratedTextColumn(
      'blurhash',
      $tableName,
      true,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  GeneratedIntColumn _height;
  @override
  GeneratedIntColumn get height => _height ??= _constructHeight();
  GeneratedIntColumn _constructHeight() {
    return GeneratedIntColumn(
      'height',
      $tableName,
      true,
    );
  }

  final VerificationMeta _widthMeta = const VerificationMeta('width');
  GeneratedIntColumn _width;
  @override
  GeneratedIntColumn get width => _width ??= _constructWidth();
  GeneratedIntColumn _constructWidth() {
    return GeneratedIntColumn(
      'width',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        guid,
        uti,
        mimeType,
        transferState,
        isOutgoing,
        transferName,
        totalBytes,
        isSticker,
        hideAttachments,
        blurhash,
        height,
        width
      ];
  @override
  $AttachmentTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attachment';
  @override
  final String actualTableName = 'attachment';
  @override
  VerificationContext validateIntegrity(Insertable<AttachmentEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('guid')) {
      context.handle(
          _guidMeta, guid.isAcceptableOrUnknown(data['guid'], _guidMeta));
    } else if (isInserting) {
      context.missing(_guidMeta);
    }
    if (data.containsKey('uti')) {
      context.handle(
          _utiMeta, uti.isAcceptableOrUnknown(data['uti'], _utiMeta));
    } else if (isInserting) {
      context.missing(_utiMeta);
    }
    if (data.containsKey('mimeType')) {
      context.handle(_mimeTypeMeta,
          mimeType.isAcceptableOrUnknown(data['mimeType'], _mimeTypeMeta));
    }
    if (data.containsKey('transferState')) {
      context.handle(
          _transferStateMeta,
          transferState.isAcceptableOrUnknown(
              data['transferState'], _transferStateMeta));
    }
    if (data.containsKey('isOutgoing')) {
      context.handle(
          _isOutgoingMeta,
          isOutgoing.isAcceptableOrUnknown(
              data['isOutgoing'], _isOutgoingMeta));
    }
    if (data.containsKey('transferName')) {
      context.handle(
          _transferNameMeta,
          transferName.isAcceptableOrUnknown(
              data['transferName'], _transferNameMeta));
    } else if (isInserting) {
      context.missing(_transferNameMeta);
    }
    if (data.containsKey('totalBytes')) {
      context.handle(
          _totalBytesMeta,
          totalBytes.isAcceptableOrUnknown(
              data['totalBytes'], _totalBytesMeta));
    } else if (isInserting) {
      context.missing(_totalBytesMeta);
    }
    if (data.containsKey('isSticker')) {
      context.handle(_isStickerMeta,
          isSticker.isAcceptableOrUnknown(data['isSticker'], _isStickerMeta));
    }
    if (data.containsKey('hideAttachments')) {
      context.handle(
          _hideAttachmentsMeta,
          hideAttachments.isAcceptableOrUnknown(
              data['hideAttachments'], _hideAttachmentsMeta));
    }
    if (data.containsKey('blurhash')) {
      context.handle(_blurhashMeta,
          blurhash.isAcceptableOrUnknown(data['blurhash'], _blurhashMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height'], _heightMeta));
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width'], _widthMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttachmentEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AttachmentEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AttachmentTableTable createAlias(String alias) {
    return $AttachmentTableTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  ChatHandleJoin _chatHandleJoin;
  ChatHandleJoin get chatHandleJoin => _chatHandleJoin ??= ChatHandleJoin(this);
  ChatMessageJoin _chatMessageJoin;
  ChatMessageJoin get chatMessageJoin =>
      _chatMessageJoin ??= ChatMessageJoin(this);
  AttachmentMessageJoin _attachmentMessageJoin;
  AttachmentMessageJoin get attachmentMessageJoin =>
      _attachmentMessageJoin ??= AttachmentMessageJoin(this);
  $MessageTableTable _messageTable;
  $MessageTableTable get messageTable =>
      _messageTable ??= $MessageTableTable(this);
  $ChatTableTable _chatTable;
  $ChatTableTable get chatTable => _chatTable ??= $ChatTableTable(this);
  $HandleTableTable _handleTable;
  $HandleTableTable get handleTable => _handleTable ??= $HandleTableTable(this);
  $AttachmentTableTable _attachmentTable;
  $AttachmentTableTable get attachmentTable =>
      _attachmentTable ??= $AttachmentTableTable(this);
  ChatDao _chatDao;
  ChatDao get chatDao => _chatDao ??= ChatDao(this as AppDatabase);
  MessageDao _messageDao;
  MessageDao get messageDao => _messageDao ??= MessageDao(this as AppDatabase);
  CMJDao _cMJDao;
  CMJDao get cMJDao => _cMJDao ??= CMJDao(this as AppDatabase);
  AMJDao _aMJDao;
  AMJDao get aMJDao => _aMJDao ??= AMJDao(this as AppDatabase);
  CHJDao _cHJDao;
  CHJDao get cHJDao => _cHJDao ??= CHJDao(this as AppDatabase);
  HandleDao _handleDao;
  HandleDao get handleDao => _handleDao ??= HandleDao(this as AppDatabase);
  AttachmentDao _attachmentDao;
  AttachmentDao get attachmentDao =>
      _attachmentDao ??= AttachmentDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        chatHandleJoin,
        chatMessageJoin,
        attachmentMessageJoin,
        messageTable,
        chatTable,
        handleTable,
        attachmentTable
      ];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$MessageDaoMixin on DatabaseAccessor<AppDatabase> {
  $MessageTableTable get messageTable => attachedDatabase.messageTable;
}
mixin _$ChatDaoMixin on DatabaseAccessor<AppDatabase> {
  $ChatTableTable get chatTable => attachedDatabase.chatTable;
}
mixin _$HandleDaoMixin on DatabaseAccessor<AppDatabase> {
  $HandleTableTable get handleTable => attachedDatabase.handleTable;
}
mixin _$CMJDaoMixin on DatabaseAccessor<AppDatabase> {}
mixin _$CHJDaoMixin on DatabaseAccessor<AppDatabase> {}
mixin _$AMJDaoMixin on DatabaseAccessor<AppDatabase> {}
mixin _$AttachmentDaoMixin on DatabaseAccessor<AppDatabase> {
  $HandleTableTable get handleTable => attachedDatabase.handleTable;
}

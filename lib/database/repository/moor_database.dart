import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'moor_database.g.dart';

@UseMoor(tables: [
  MessageTable,
  ChatTable,
  HandleTable,
  AttachmentTable
], include: {
  "join_tables.moor"
}, daos: [
  ChatDao,
  MessageDao,
  CMJDao,
  AMJDao,
  CHJDao,
  HandleDao,
  AttachmentDao
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// This is the DB verison, bump this up after changing the db
  @override
  int get schemaVersion => 3;

  /// Migrates newer db versions, when modifying, make sure to increase schema version
  /// AND update the [onUpgrade] function
  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            // await m.addColumn(ChatTable, column)
          }
        },
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'chatdb.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@DataClassName("MessageEntity")
class MessageTable extends Table {
  String get tableName => 'message';

  @JsonKey("ROWID")
  IntColumn get id => integer().autoIncrement()();

  @JsonKey("originalROWID")
  IntColumn get originalROWID => integer().nullable().named("originalROWID")();

  @JsonKey("handleId")
  IntColumn get handleId => integer().named("handleId")();

  TextColumn get guid => text()();

  @JsonKey("text")
  TextColumn get contentText => text().named("text")();

  TextColumn get subject => text().nullable()();

  TextColumn get country => text().nullable()();

  IntColumn get error => integer().withDefault(const Constant(0))();

  @JsonKey("dateCreated")
  DateTimeColumn get dateCreated =>
      dateTime().nullable().named("dateCreated")();

  @JsonKey("dateRead")
  DateTimeColumn get dateRead => dateTime().nullable().named("dateRead")();

  @JsonKey("dateDelivered")
  DateTimeColumn get dateDelivered =>
      dateTime().nullable().named("dateDelivered")();

  @JsonKey("isFromMe")
  BoolColumn get isFromMe =>
      boolean().withDefault(const Constant(false)).named("isFromMe")();

  @JsonKey("isDelayed")
  BoolColumn get isDelayed =>
      boolean().withDefault(const Constant(false)).named("isDelayed")();

  @JsonKey("isAutoReply")
  BoolColumn get isAutoReply =>
      boolean().withDefault(const Constant(false)).named("isAutoReply")();

  @JsonKey("isSystemMessage")
  BoolColumn get isSystemMessage =>
      boolean().withDefault(const Constant(false)).named("isSystemMessage")();

  @JsonKey("isServiceMessage")
  BoolColumn get isServiceMessage =>
      boolean().withDefault(const Constant(false)).named("isServiceMessage")();

  @JsonKey("isForward")
  BoolColumn get isForward =>
      boolean().withDefault(const Constant(false)).named("isForward")();

  @JsonKey("isArchived")
  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false)).named("isArchived")();

  @JsonKey("cacheRoomnames")
  TextColumn get cacheRoomnames => text().nullable().named("cacheRoomnames")();

  @JsonKey("isAudioMessage")
  BoolColumn get isAudioMessage =>
      boolean().withDefault(const Constant(false)).named("isAudioMessage")();

  @JsonKey("datePlayed")
  DateTimeColumn get datePlayed => dateTime().nullable().named("datePlayed")();

  @JsonKey("itemType")
  IntColumn get itemType =>
      integer().withDefault(const Constant(0)).named("itemType")();

  @JsonKey("groupTitle")
  TextColumn get groupTitle => text().nullable().named("groupTitle")();

  @JsonKey("groupActionType")
  IntColumn get groupActionType =>
      integer().withDefault(const Constant(0)).named("groupActionType")();

  @JsonKey("isExpired")
  BoolColumn get isExpired =>
      boolean().withDefault(const Constant(false)).named("isExpired")();

  @JsonKey("associatedMessageGuid")
  TextColumn get associatedMessageGuid =>
      text().nullable().named("associatedMessageGuid")();

  @JsonKey("associatedMessageType")
  TextColumn get associatedMessageType =>
      text().nullable().named("associatedMessageType")();

  @JsonKey("expressiveSendStyleId")
  TextColumn get expressiveSendStyleId =>
      text().nullable().named("expressiveSendStyleId")();

  @JsonKey("timeExpressiveSendStyleId")
  IntColumn get timeExpressiveSendStyleId => integer()
      .withDefault(const Constant(0))
      .named("timeExpressiveSendStyleId")();

  @JsonKey("hasAttachments")
  BoolColumn get hasAttachments =>
      boolean().withDefault(const Constant(false)).named("hasAttachments")();

  @JsonKey("hasReactions")
  BoolColumn get hasReactions =>
      boolean().withDefault(const Constant(false)).named("hasReactions")();

  @override
  List<String> get customConstraints =>
      ['UNIQUE(guid)', 'FOREIGN KEY (handleId) REFERENCES handle(id)'];
}

@UseDao(tables: [MessageTable])
class MessageDao extends DatabaseAccessor<AppDatabase> with _$MessageDaoMixin {
  MessageDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<MessageEntity>> find(Map<String, dynamic> params,
      {bool findOne = false, int limit, int offset = 0}) {
    final query = select(attachedDatabase.messageTable);

    params.forEach((key, value) {
      final column = attachedDatabase.messageTable.columnsByName[key];
      query.where((message) => column.equals(value));
    });
    if (limit != null) {
      query.limit(limit, offset: offset);
    }
    return transaction(() => findOne ? (query..limit(1)).get() : query.get());
  }

  Future<int> insertEntry(MessageEntity entry) {
    return transaction(() => into(attachedDatabase.messageTable).insert(entry));
  }

  Future<int> updateEntry(MessageTableCompanion companion) {
    return transaction(() => (update(attachedDatabase.messageTable)
          ..where((c) => c.id.equals(companion.id.value)))
        .write(companion));
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.messageTable);

    params.forEach((key, value) {
      final column = attachedDatabase.messageTable.columnsByName[key];
      deletion.where((message) => column.equals(value));
    });
    return transaction(() => deletion.go());
  }
}

@DataClassName("ChatEntity")
class ChatTable extends Table {
  String get tableName => 'chat';

  @JsonKey("ROWID")
  IntColumn get id => integer().autoIncrement()();

  TextColumn get guid => text()();

  IntColumn get style => integer()();

  @JsonKey("chatIdentifier")
  TextColumn get chatIdentifier => text().named("chatIdentifier")();

  @JsonKey("isArchived")
  BoolColumn get isArchived =>
      boolean().withDefault(const Constant(false)).named("isArchived")();

  @JsonKey("isMuted")
  BoolColumn get isMuted =>
      boolean().withDefault(const Constant(false)).named("isMuted")();

  @JsonKey("hasUnreadMessage")
  BoolColumn get hasUnreadMessage =>
      boolean().withDefault(const Constant(false)).named("hasUnreadMessage")();

  @JsonKey("latestMessageDate")
  DateTimeColumn get latestMessageDate => dateTime()
      .nullable()
      .withDefault(const Constant(null))
      .named("latestMessageDate")();

  @JsonKey("latestMessageText")
  TextColumn get latestMessageText =>
      text().nullable().named("latestMessageText")();

  @JsonKey("displayName")
  TextColumn get displayName => text().nullable().named("displayName")();

  @override
  List<String> get customConstraints => ['UNIQUE(guid)'];
}

@UseDao(tables: [ChatTable])
class ChatDao extends DatabaseAccessor<AppDatabase> with _$ChatDaoMixin {
  ChatDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  ///Creates a continuous stream from the chat table in the db
  ///Upates automatically with a [ChatTable] instance
  ///Does not auto convert to a [Chat] instance, so no methods
  ///chatTable is a property of the database, referring to the actual table in the db
  Future<List<ChatEntity>> find(Map<String, dynamic> params,
      {bool findOne = false, int offset = 0, int limit}) {
    final query = select(attachedDatabase.chatTable);

    params.forEach((key, value) {
      final column = attachedDatabase.chatTable.columnsByName[key];
      query.where((ChatTable chat) => column.equals(value));
    });
    if (limit != null) {
      query.limit(limit, offset: offset);
    }

    return transaction(() => findOne ? (query..limit(1)).get() : query.get());
  }

  Future<int> insertEntry(ChatEntity entry) async {
    return transaction(() => into(attachedDatabase.chatTable).insert(entry));
  }

  Future<int> updateEntry(ChatTableCompanion companion) {
    return transaction(() => (update(attachedDatabase.chatTable)
          ..where((c) => c.id.equals(companion.id.value)))
        .write(companion));
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.chatTable);

    params.forEach((key, value) {
      final column = attachedDatabase.chatTable.columnsByName[key];
      deletion.where((ChatTable chat) => column.equals(value));
    });
    return transaction(() => deletion.go());
  }

  Future<List<MessageWithHandleByCMJ>> getMessages(
    int chatId,
    bool originalROWIDIsNull, {
    int limit,
    int offset = 0,
  }) async {
    final query = select(attachedDatabase.messageTable).join([
      innerJoin(
          attachedDatabase.chatMessageJoin,
          attachedDatabase.chatMessageJoin.messageId
              .equalsExp(attachedDatabase.messageTable.id)),
      leftOuterJoin(
          attachedDatabase.handleTable,
          attachedDatabase.handleTable.id
              .equalsExp(attachedDatabase.messageTable.handleId)),
    ])
      ..where(attachedDatabase.chatMessageJoin.messageId.equals(chatId));
    if (limit != null) {
      query.limit(limit, offset: offset);
    }
    return transaction(() async => (await query.get()).map((row) {
          return MessageWithHandleByCMJ(
            row.readTable(attachedDatabase.messageTable),
            row.readTable(attachedDatabase.handleTable),
          );
        }));
  }
}

@DataClassName("HandleEntity")
class HandleTable extends Table {
  String get tableName => 'handle';

  @JsonKey("ROWID")
  IntColumn get id => integer().autoIncrement()();

  TextColumn get address => text()();

  TextColumn get country => text().nullable()();

  @JsonKey("uncanonicalizedId")
  TextColumn get uncanonicalizedId =>
      text().nullable().named("uncanonicalizedId")();
}

@UseDao(tables: [HandleTable])
class HandleDao extends DatabaseAccessor<AppDatabase> with _$HandleDaoMixin {
  HandleDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<HandleEntity>> find(Map<String, dynamic> params,
      {bool getOne = false}) {
    final query = select(attachedDatabase.handleTable);

    params.forEach((key, value) {
      final column = attachedDatabase.handleTable.columnsByName[key];
      query.where((handle) => column.equals(value));
    });
    return transaction(() => getOne ? (query..limit(1)).get() : query.get());
  }

  Future<int> insertEntry(HandleEntity entity) {
    return transaction(() => into(attachedDatabase.handleTable).insert(entity));
  }

  Future<int> updateEntry(HandleTableCompanion companion) {
    return transaction(() => (update(attachedDatabase.handleTable)
          ..where((h) => h.id.equals(companion.id.value)))
        .write(companion));
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.handleTable);

    params.forEach((key, value) {
      final column = attachedDatabase.handleTable.columnsByName[key];
      deletion.where((handle) => column.equals(value));
    });
    return transaction(() => deletion.go());
  }
}

@UseDao(tables: [ChatMessageJoin])
class CMJDao extends DatabaseAccessor<AppDatabase> with _$CMJDaoMixin {
  CMJDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<ChatMessageJoinData>> find(Map<String, dynamic> params) {
    final query = select(attachedDatabase.chatMessageJoin);

    params.forEach((key, value) {
      final column = attachedDatabase.chatMessageJoin.columnsByName[key];
      query.where((message) => column.equals(value));
    });
    return transaction(() => query.get());
  }

  Future<int> insertEntry(int chatId, int messageId) {
    return transaction(() => into(attachedDatabase.chatMessageJoin)
        .insert(new ChatMessageJoinData(chatId: chatId, messageId: messageId)));
  }
}

@UseDao(tables: [ChatHandleJoin])
class CHJDao extends DatabaseAccessor<AppDatabase> with _$CHJDaoMixin {
  CHJDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<ChatHandleJoinData>> find(Map<String, dynamic> params) {
    final query = select(attachedDatabase.chatHandleJoin);

    params.forEach((key, value) {
      final column = attachedDatabase.chatHandleJoin.columnsByName[key];
      query.where((ajm) => column.equals(value));
    });
    return transaction(() => query.get());
  }

  Future<int> insertEntry(int chatId, int handleId) {
    return transaction(() => into(attachedDatabase.chatHandleJoin)
        .insert(new ChatHandleJoinData(chatId: chatId, handleId: handleId)));
  }
}

@UseDao(tables: [ChatMessageJoin])
class AMJDao extends DatabaseAccessor<AppDatabase> with _$AMJDaoMixin {
  AMJDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<AttachmentMessageJoinData>> find(Map<String, dynamic> params) {
    final query = select(attachedDatabase.attachmentMessageJoin);

    params.forEach((key, value) {
      final column = attachedDatabase.attachmentMessageJoin.columnsByName[key];
      query.where((ajm) => column.equals(value));
    });
    return transaction(() => query.get());
  }

  Future<int> insertEntry(int attachmentId, int messageId) {
    return transaction(() => into(attachedDatabase.attachmentMessageJoin)
        .insert(new AttachmentMessageJoinData(
            attachmentId: attachmentId, messageId: messageId)));
  }
}

@DataClassName("AttachmentEntity")
class AttachmentTable extends Table {
  String get tableName => "attachment";
  @JsonKey("ROWID")
  IntColumn get id => integer().autoIncrement()();

  TextColumn get guid => text()();

  TextColumn get uti => text()();

  @JsonKey("mimeType")
  TextColumn get mimeType => text().nullable().named("mimeType")();

  @JsonKey("transferState")
  IntColumn get transferState =>
      integer().withDefault(const Constant(0)).named("transferState")();

  @JsonKey("isOutgoing")
  BoolColumn get isOutgoing =>
      boolean().withDefault(const Constant(false)).named("isOutgoing")();

  @JsonKey("transferName")
  TextColumn get transferName => text().named("transferName")();

  @JsonKey("totalBytes")
  IntColumn get totalBytes => integer().named("totalBytes")();

  @JsonKey("isSticker")
  BoolColumn get isSticker =>
      boolean().withDefault(const Constant(false)).named("isSticker")();

  @JsonKey("hideAttachments")
  BoolColumn get hideAttachments =>
      boolean().withDefault(const Constant(false)).named("hideAttachments")();

  TextColumn get blurhash => text().nullable()();

  IntColumn get height => integer().nullable()();

  IntColumn get width => integer().nullable()();
  @override
  List<String> get customConstraints => ['UNIQUE(guid)'];
}

@UseDao(tables: [HandleTable])
class AttachmentDao extends DatabaseAccessor<AppDatabase>
    with _$AttachmentDaoMixin {
  AttachmentDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<AttachmentEntity>> find(Map<String, dynamic> params,
      {bool getOne = false}) {
    final query = select(attachedDatabase.attachmentTable);

    params.forEach((key, value) {
      final column = attachedDatabase.attachmentTable.columnsByName[key];
      query.where((attachment) => column.equals(value));
    });
    return transaction(() => getOne ? (query..limit(1)).get() : query.get());
  }

  Future<int> insertEntry(AttachmentEntity entity) {
    return transaction(
        () => into(attachedDatabase.attachmentTable).insert(entity));
  }

  Future<int> updateEntry(AttachmentTableCompanion companion) {
    return transaction(() => (update(attachedDatabase.attachmentTable)
          ..where((h) => h.id.equals(companion.id.value)))
        .write(companion));
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.attachmentTable);

    params.forEach((key, value) {
      final column = attachedDatabase.attachmentTable.columnsByName[key];
      deletion.where((attachment) => column.equals(value));
    });
    return transaction(() => deletion.go());
  }
}

class MessageWithHandleByCMJ {
  MessageWithHandleByCMJ(this.message, this.handle);

  final MessageEntity message;
  final HandleEntity handle;
}

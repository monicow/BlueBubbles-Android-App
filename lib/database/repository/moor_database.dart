import 'dart:io';

import 'package:bluebubbles/managers/settings_manager.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
part 'moor_database.g.dart';

@UseMoor(include: {"join_tables.moor"}, daos: [ChatDao, MessageDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// This is the DB verison, bump this up after changing the db
  @override
  int get schemaVersion => 1;

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
    /// Creates the file [chat.db] in the
    final file = File(SettingsManager().appDocDir.path + "/chat.db");
    return VmDatabase(file);
  });
}

@DataClassName("MessageEntry")
class MessageTable extends Table {
  String get tableName => 'message';

  @JsonKey("ROWID")
  IntColumn get id => integer().autoIncrement().named("ROWID")();

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
  IntColumn get expressiveSendStyleId =>
      integer().withDefault(const Constant(0)).named("expressiveSendStyleId")();

  @JsonKey("timeExpressiveSendStyleId")
  IntColumn get timeExpressiveSendStyleId => integer()
      .withDefault(const Constant(0))
      .named("timeExpressiveSendStyleId")();

  @JsonKey("hasAttachments")
  BoolColumn get hasAttachments =>
      boolean().withDefault(const Constant(false)).named("hasAttachments")();

  @override
  List<String> get customConstraints =>
      ['FOREIGN KEY (handleId) REFERENCES handle(ROWID)'];
}

@UseDao(tables: [Chat])
class ChatDao extends DatabaseAccessor<AppDatabase> with _$ChatDaoMixin {
  ChatDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  ///Creates a continuous stream from the chat table in the db
  ///Upates automatically with a [ChatTable] instance
  ///Does not auto convert to a [Chat] instance, so no methods
  ///chatTable is a property of the database, referring to the actual table in the db
  Future<List<ChatEntity>> find(Map<String, dynamic> params) {
    final query = select(attachedDatabase.chat);

    for (final entry in params.entries) {
      final column = attachedDatabase.chat.columnsByName[entry.key];
      final columnMatches = entry.value.fold(null, (condition, element) {
        if (condition == null) return column.equalsExp(element);
        return condition | column.equalsExp(element);
      });

      query.where(columnMatches);
      break;
    }
    return query.get();
  }

  Future<int> insertEntry(ChatEntity entry) async {
    return into(attachedDatabase.chat).insert(entry);
  }

  Future<bool> updateEntry(ChatEntity entry) async {
    return update(attachedDatabase.chat).replace(entry);
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.chat);

    for (final entry in params.entries) {
      final column = attachedDatabase.chat.columnsByName[entry.key];
      final columnMatches = entry.value.fold(null, (condition, element) {
        if (condition == null) return column.equalsExp(element);
        return condition | column.equalsExp(element);
      });

      deletion.where(columnMatches);
      break;
    }
    return deletion.go();
  }
}

@UseDao(tables: [Message])
class MessageDao extends DatabaseAccessor<AppDatabase> with _$MessageDaoMixin {
  MessageDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<List<MessageEntity>> find(Map<String, dynamic> params) {
    final query = select(attachedDatabase.message);

    for (final entry in params.entries) {
      final column = attachedDatabase.message.columnsByName[entry.key];
      final columnMatches = entry.value.fold(null, (condition, element) {
        if (condition == null) return column.equalsExp(element);
        return condition | column.equalsExp(element);
      });

      query.where(columnMatches);
      break;
    }
    return query.get();
  }

  Future<int> insertEntry(MessageEntity entry) {
    return into(attachedDatabase.message).insert(entry);
  }

  Future<bool> updateEntry(MessageEntity entry) {
    return update(attachedDatabase.message).replace(entry);
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.message);

    for (final entry in params.entries) {
      final column = attachedDatabase.message.columnsByName[entry.key];
      final columnMatches = entry.value.fold(null, (condition, element) {
        if (condition == null) return column.equalsExp(element);
        return condition | column.equalsExp(element);
      });

      deletion.where(columnMatches);
      break;
    }
    return deletion.go();
  }
}

@UseDao(tables: [ChatMessageJoin])
class CMJDao extends DatabaseAccessor<AppDatabase> with _$MessageDaoMixin {
  CMJDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insertEntry(int chatId, int messageId) {
    return into(attachedDatabase.chatMessageJoin)
        .insert(new ChatMessageJoinData(chatId: chatId, messageId: messageId));
  }

  Future<bool> updateEntry(int chatId, int messageId) {
    return update(attachedDatabase.chatMessageJoin)
        .replace(new ChatMessageJoinData(chatId: chatId, messageId: messageId));
  }

  Future deleteEntry(Map<String, dynamic> params) async {
    final deletion = delete(attachedDatabase.chatMessageJoin);

    for (final entry in params.entries) {
      final column = attachedDatabase.chatMessageJoin.columnsByName[entry.key];
      final columnMatches = entry.value.fold(null, (condition, element) {
        if (condition == null) return column.equalsExp(element);
        return condition | column.equalsExp(element);
      });

      deletion.where(columnMatches);
      break;
    }
    return deletion.go();
  }
}

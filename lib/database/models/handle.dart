import 'dart:convert';
import 'package:bluebubbles/database/repository/database.dart';
import 'package:bluebubbles/database/repository/moor_database.dart';
import 'package:sqflite/sqflite.dart';

import './chat.dart';

class Handle {
  int id;
  String address;
  String country;
  String uncanonicalizedId;

  Handle({
    this.id,
    this.address,
    this.country,
    this.uncanonicalizedId,
  });

  factory Handle.fromMap(Map<String, dynamic> json) {
    return Handle.fromHandleEntity(HandleEntity.fromJson(json));
  }

  factory Handle.fromHandleEntity(HandleEntity entity) {
    return new Handle(
      id: entity.id,
      address: entity.address,
      country: entity.country,
      uncanonicalizedId: entity.uncanonicalizedId,
    );
  }

  Future<Handle> save([bool updateIfAbsent = false]) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // Try to find an existing chat before saving it
    Handle existing = await Handle.findOne({"address": this.address});
    if (existing != null) {
      this.id = existing.id;
    }

    // If it already exists, update it
    if (existing == null) {
      // Remove the ID from the map for inserting
      this.id = null;
      try {
        this.id = await db.handleDao.insertEntry(this.toEntity());
      } catch (e) {
        this.id = null;
      }
    } else if (updateIfAbsent) {
      await this.update();
    }

    return this;
  }

  Future<Handle> update() async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // If it already exists, update it
    if (this.id != null) {
      HandleTableCompanion entity = HandleEntity(
        id: null,
        address: this.address,
        country: this.country,
        uncanonicalizedId: this.uncanonicalizedId,
      ).toCompanion(true);

      await db.handleDao.updateEntry(entity);
    } else {
      await this.save(false);
    }

    return this;
  }

  static Future<Handle> findOne(Map<String, dynamic> filters) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<HandleEntity> res = await db.handleDao.find(filters, getOne: true);

    if (res.isEmpty) {
      return null;
    }

    return Handle.fromHandleEntity(res.first);
  }

  static Future<List<Handle>> find(
      [Map<String, dynamic> filters = const {}]) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<HandleEntity> res = await db.handleDao.find(filters);

    return (res.isNotEmpty)
        ? res.map((c) => Handle.fromHandleEntity(c)).toList()
        : [];
  }

  static Future<List<Chat>> getChats(Handle handle) async {
    final Database db = await DBProvider.db.database;

    var res = await db.rawQuery(
        "SELECT"
        " chat.ROWID AS ROWID,"
        " chat.guid AS guid,"
        " chat.style AS style,"
        " chat.chatIdentifier AS chatIdentifier,"
        " chat.isArchived AS isArchived,"
        " chat.displayName AS displayName"
        " FROM handle"
        " JOIN chat_handle_join AS chj ON handle.ROWID = chj.handleId"
        " JOIN chat ON chat.ROWID = chj.chatId"
        " WHERE handle.address = ? OR handle.ROWID;",
        [handle.address, handle.id]);

    return (res.isNotEmpty) ? res.map((c) => Chat.fromMap(c)).toList() : [];
  }

  // static flush() async {
  //   final Database db = await DBProvider.db.database;
  //   await db.delete("handle");
  // }

  HandleEntity toEntity() => HandleEntity(
        id: this.id,
        address: this.address,
        country: this.country,
        uncanonicalizedId: this.uncanonicalizedId,
      );
}

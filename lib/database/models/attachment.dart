import 'dart:convert';
import 'dart:io';
import 'package:bluebubbles/database/repository/moor_database.dart';
import 'package:bluebubbles/managers/settings_manager.dart';
import 'package:bluebubbles/database/models/message.dart';
import 'package:bluebubbles/database/repository/database.dart';
import 'package:sqflite/sqflite.dart';

class Attachment {
  int id;
  String guid;
  String uti;
  String mimeType;
  String transferState;
  bool isOutgoing;
  String transferName;
  int totalBytes;
  bool isSticker;
  bool hideAttachment;
  String blurhash;
  int height;
  int width;

  Attachment({
    this.id,
    this.guid,
    this.uti,
    this.mimeType,
    this.transferState,
    this.isOutgoing,
    this.transferName,
    this.totalBytes,
    this.isSticker,
    this.hideAttachment,
    this.blurhash,
    this.height,
    this.width,
  });

  factory Attachment.fromMap(Map<String, dynamic> json) {
    String mimeType = json["mimeType"];
    if ((json['transferName'] as String).endsWith(".caf")) {
      mimeType = "audio/caf";
    }
    return Attachment.fromEntity(
        AttachmentEntity.fromJson(json).copyWith(mimeType: mimeType));
  }

  factory Attachment.fromEntity(AttachmentEntity entity) {
    return Attachment(
      id: entity.id,
      guid: entity.guid,
      uti: entity.uti,
      mimeType: entity.mimeType,
      transferState: entity.transferState.toString(),
      transferName: entity.transferName,
      totalBytes: entity.totalBytes,
      isSticker: entity.isSticker,
      hideAttachment: entity.hideAttachments,
      blurhash: entity.blurhash,
      height: entity.height,
      width: entity.width,
    );
  }

  Future<Attachment> save(Message message) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    // Try to find an existing attachment before saving it
    Attachment existing = await Attachment.findOne({"guid": this.guid});
    if (existing != null) {
      this.id = existing.id;
    }

    // If it already exists, update it
    if (existing == null) {
      // Remove the ID from the map for inserting
      AttachmentEntity entity = this.toEntity().copyWith(id: null);

      this.id = await db.attachmentDao.insertEntry(entity);
      await db.aMJDao.insertEntry(this.id, message.id);
    }

    return this;
  }

  static Future<Attachment> replaceAttachment(
      String oldGuid, Attachment newAttachment) async {
    final AppDatabase db = await DBProvider.db.appDatabase;
    Attachment existing = await Attachment.findOne({"guid": oldGuid});
    if (existing == null) {
      throw ("Old GUID does not exist!");
    }

    AttachmentTableCompanion params =
        newAttachment.toEntity().copyWith(id: existing.id).toCompanion(true);

    await db.attachmentDao.updateEntry(params);
    String appDocPath = SettingsManager().appDocDir.path;
    String pathName = "$appDocPath/attachments/$oldGuid";
    Directory directory = Directory(pathName);
    await directory.rename("$appDocPath/attachments/${newAttachment.guid}");
    return existing;
  }

  static Future<Attachment> findOne(Map<String, dynamic> filters) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<AttachmentEntity> res =
        await db.attachmentDao.find(filters, getOne: true);

    if (res.isEmpty) {
      return null;
    }

    return Attachment.fromEntity(res.first);
  }

  static Future<List<Attachment>> find(
      [Map<String, dynamic> filters = const {}]) async {
    final AppDatabase db = await DBProvider.db.appDatabase;

    List<AttachmentEntity> res = await db.attachmentDao.find(filters);
    return (res.isNotEmpty)
        ? res.map((c) => Attachment.fromEntity(c)).toList()
        : [];
  }

  static flush() async {
    final Database db = await DBProvider.db.database;
    await db.delete("attachment");
  }

  getFriendlySize({decimals: 2}) {
    double size = (this.totalBytes / 1024000.0);
    String postfix = "MB";
    if (size < 1) {
      size = size * 1024;
      postfix = "KB";
    } else if (size > 1024) {
      size = size / 1024;
      postfix = "GB";
    }

    return "${size.toStringAsFixed(decimals)} $postfix";
  }

  AttachmentEntity toEntity() => AttachmentEntity(
        id: id,
        guid: guid,
        uti: uti,
        transferState: int.parse(transferState),
        isOutgoing: isOutgoing,
        transferName: transferName,
        totalBytes: totalBytes,
        isSticker: isSticker,
        hideAttachments: hideAttachment,
      );
}

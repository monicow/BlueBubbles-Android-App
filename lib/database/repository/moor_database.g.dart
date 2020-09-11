// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ChatEntity extends DataClass implements Insertable<ChatEntity> {
  final String guid;
  final int style;
  final String chatIdentifier;
  final int isArchived;
  final int isMuted;
  final int hasUnreadMessage;
  final int latestMessageDate;
  final String latestMessageText;
  final String displayName;
  ChatEntity(
      {@required this.guid,
      @required this.style,
      @required this.chatIdentifier,
      this.isArchived,
      this.isMuted,
      this.hasUnreadMessage,
      this.latestMessageDate,
      this.latestMessageText,
      this.displayName});
  factory ChatEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return ChatEntity(
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      style: intType.mapFromDatabaseResponse(data['${effectivePrefix}style']),
      chatIdentifier: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}chatIdentifier']),
      isArchived:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}isArchived']),
      isMuted:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}isMuted']),
      hasUnreadMessage: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}hasUnreadMessage']),
      latestMessageDate: intType
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
      map['isArchived'] = Variable<int>(isArchived);
    }
    if (!nullToAbsent || isMuted != null) {
      map['isMuted'] = Variable<int>(isMuted);
    }
    if (!nullToAbsent || hasUnreadMessage != null) {
      map['hasUnreadMessage'] = Variable<int>(hasUnreadMessage);
    }
    if (!nullToAbsent || latestMessageDate != null) {
      map['latestMessageDate'] = Variable<int>(latestMessageDate);
    }
    if (!nullToAbsent || latestMessageText != null) {
      map['latestMessageText'] = Variable<String>(latestMessageText);
    }
    if (!nullToAbsent || displayName != null) {
      map['displayName'] = Variable<String>(displayName);
    }
    return map;
  }

  ChatCompanion toCompanion(bool nullToAbsent) {
    return ChatCompanion(
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
      guid: serializer.fromJson<String>(json['guid']),
      style: serializer.fromJson<int>(json['style']),
      chatIdentifier: serializer.fromJson<String>(json['chatIdentifier']),
      isArchived: serializer.fromJson<int>(json['isArchived']),
      isMuted: serializer.fromJson<int>(json['isMuted']),
      hasUnreadMessage: serializer.fromJson<int>(json['hasUnreadMessage']),
      latestMessageDate: serializer.fromJson<int>(json['latestMessageDate']),
      latestMessageText: serializer.fromJson<String>(json['latestMessageText']),
      displayName: serializer.fromJson<String>(json['displayName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'style': serializer.toJson<int>(style),
      'chatIdentifier': serializer.toJson<String>(chatIdentifier),
      'isArchived': serializer.toJson<int>(isArchived),
      'isMuted': serializer.toJson<int>(isMuted),
      'hasUnreadMessage': serializer.toJson<int>(hasUnreadMessage),
      'latestMessageDate': serializer.toJson<int>(latestMessageDate),
      'latestMessageText': serializer.toJson<String>(latestMessageText),
      'displayName': serializer.toJson<String>(displayName),
    };
  }

  ChatEntity copyWith(
          {String guid,
          int style,
          String chatIdentifier,
          int isArchived,
          int isMuted,
          int hasUnreadMessage,
          int latestMessageDate,
          String latestMessageText,
          String displayName}) =>
      ChatEntity(
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
                                  displayName.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatEntity &&
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

class ChatCompanion extends UpdateCompanion<ChatEntity> {
  final Value<String> guid;
  final Value<int> style;
  final Value<String> chatIdentifier;
  final Value<int> isArchived;
  final Value<int> isMuted;
  final Value<int> hasUnreadMessage;
  final Value<int> latestMessageDate;
  final Value<String> latestMessageText;
  final Value<String> displayName;
  const ChatCompanion({
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
  ChatCompanion.insert({
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
    Expression<String> guid,
    Expression<int> style,
    Expression<String> chatIdentifier,
    Expression<int> isArchived,
    Expression<int> isMuted,
    Expression<int> hasUnreadMessage,
    Expression<int> latestMessageDate,
    Expression<String> latestMessageText,
    Expression<String> displayName,
  }) {
    return RawValuesInsertable({
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

  ChatCompanion copyWith(
      {Value<String> guid,
      Value<int> style,
      Value<String> chatIdentifier,
      Value<int> isArchived,
      Value<int> isMuted,
      Value<int> hasUnreadMessage,
      Value<int> latestMessageDate,
      Value<String> latestMessageText,
      Value<String> displayName}) {
    return ChatCompanion(
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
      map['isArchived'] = Variable<int>(isArchived.value);
    }
    if (isMuted.present) {
      map['isMuted'] = Variable<int>(isMuted.value);
    }
    if (hasUnreadMessage.present) {
      map['hasUnreadMessage'] = Variable<int>(hasUnreadMessage.value);
    }
    if (latestMessageDate.present) {
      map['latestMessageDate'] = Variable<int>(latestMessageDate.value);
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
    return (StringBuffer('ChatCompanion(')
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

class Chat extends Table with TableInfo<Chat, ChatEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  Chat(this._db, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn('guid', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _styleMeta = const VerificationMeta('style');
  GeneratedIntColumn _style;
  GeneratedIntColumn get style => _style ??= _constructStyle();
  GeneratedIntColumn _constructStyle() {
    return GeneratedIntColumn('style', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _chatIdentifierMeta =
      const VerificationMeta('chatIdentifier');
  GeneratedTextColumn _chatIdentifier;
  GeneratedTextColumn get chatIdentifier =>
      _chatIdentifier ??= _constructChatIdentifier();
  GeneratedTextColumn _constructChatIdentifier() {
    return GeneratedTextColumn('chatIdentifier', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _isArchivedMeta = const VerificationMeta('isArchived');
  GeneratedIntColumn _isArchived;
  GeneratedIntColumn get isArchived => _isArchived ??= _constructIsArchived();
  GeneratedIntColumn _constructIsArchived() {
    return GeneratedIntColumn('isArchived', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _isMutedMeta = const VerificationMeta('isMuted');
  GeneratedIntColumn _isMuted;
  GeneratedIntColumn get isMuted => _isMuted ??= _constructIsMuted();
  GeneratedIntColumn _constructIsMuted() {
    return GeneratedIntColumn('isMuted', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _hasUnreadMessageMeta =
      const VerificationMeta('hasUnreadMessage');
  GeneratedIntColumn _hasUnreadMessage;
  GeneratedIntColumn get hasUnreadMessage =>
      _hasUnreadMessage ??= _constructHasUnreadMessage();
  GeneratedIntColumn _constructHasUnreadMessage() {
    return GeneratedIntColumn('hasUnreadMessage', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _latestMessageDateMeta =
      const VerificationMeta('latestMessageDate');
  GeneratedIntColumn _latestMessageDate;
  GeneratedIntColumn get latestMessageDate =>
      _latestMessageDate ??= _constructLatestMessageDate();
  GeneratedIntColumn _constructLatestMessageDate() {
    return GeneratedIntColumn('latestMessageDate', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _latestMessageTextMeta =
      const VerificationMeta('latestMessageText');
  GeneratedTextColumn _latestMessageText;
  GeneratedTextColumn get latestMessageText =>
      _latestMessageText ??= _constructLatestMessageText();
  GeneratedTextColumn _constructLatestMessageText() {
    return GeneratedTextColumn('latestMessageText', $tableName, true,
        $customConstraints: '');
  }

  final VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  GeneratedTextColumn _displayName;
  GeneratedTextColumn get displayName =>
      _displayName ??= _constructDisplayName();
  GeneratedTextColumn _constructDisplayName() {
    return GeneratedTextColumn('displayName', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<String>('NULL'));
  }

  @override
  List<GeneratedColumn> get $columns => [
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
  Chat get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chat';
  @override
  final String actualTableName = 'chat';
  @override
  VerificationContext validateIntegrity(Insertable<ChatEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ChatEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ChatEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Chat createAlias(String alias) {
    return Chat(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class HandleEntity extends DataClass implements Insertable<HandleEntity> {
  final String address;
  final String country;
  final String uncanonicalizedId;
  HandleEntity({@required this.address, this.country, this.uncanonicalizedId});
  factory HandleEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return HandleEntity(
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

  HandleCompanion toCompanion(bool nullToAbsent) {
    return HandleCompanion(
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
      address: serializer.fromJson<String>(json['address']),
      country: serializer.fromJson<String>(json['country']),
      uncanonicalizedId: serializer.fromJson<String>(json['uncanonicalizedId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'address': serializer.toJson<String>(address),
      'country': serializer.toJson<String>(country),
      'uncanonicalizedId': serializer.toJson<String>(uncanonicalizedId),
    };
  }

  HandleEntity copyWith(
          {String address, String country, String uncanonicalizedId}) =>
      HandleEntity(
        address: address ?? this.address,
        country: country ?? this.country,
        uncanonicalizedId: uncanonicalizedId ?? this.uncanonicalizedId,
      );
  @override
  String toString() {
    return (StringBuffer('HandleEntity(')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('uncanonicalizedId: $uncanonicalizedId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      address.hashCode, $mrjc(country.hashCode, uncanonicalizedId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is HandleEntity &&
          other.address == this.address &&
          other.country == this.country &&
          other.uncanonicalizedId == this.uncanonicalizedId);
}

class HandleCompanion extends UpdateCompanion<HandleEntity> {
  final Value<String> address;
  final Value<String> country;
  final Value<String> uncanonicalizedId;
  const HandleCompanion({
    this.address = const Value.absent(),
    this.country = const Value.absent(),
    this.uncanonicalizedId = const Value.absent(),
  });
  HandleCompanion.insert({
    @required String address,
    this.country = const Value.absent(),
    this.uncanonicalizedId = const Value.absent(),
  }) : address = Value(address);
  static Insertable<HandleEntity> custom({
    Expression<String> address,
    Expression<String> country,
    Expression<String> uncanonicalizedId,
  }) {
    return RawValuesInsertable({
      if (address != null) 'address': address,
      if (country != null) 'country': country,
      if (uncanonicalizedId != null) 'uncanonicalizedId': uncanonicalizedId,
    });
  }

  HandleCompanion copyWith(
      {Value<String> address,
      Value<String> country,
      Value<String> uncanonicalizedId}) {
    return HandleCompanion(
      address: address ?? this.address,
      country: country ?? this.country,
      uncanonicalizedId: uncanonicalizedId ?? this.uncanonicalizedId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
    return (StringBuffer('HandleCompanion(')
          ..write('address: $address, ')
          ..write('country: $country, ')
          ..write('uncanonicalizedId: $uncanonicalizedId')
          ..write(')'))
        .toString();
  }
}

class Handle extends Table with TableInfo<Handle, HandleEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  Handle(this._db, [this._alias]);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, false,
        $customConstraints: 'UNIQUE NOT NULL');
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn('country', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<String>('NULL'));
  }

  final VerificationMeta _uncanonicalizedIdMeta =
      const VerificationMeta('uncanonicalizedId');
  GeneratedTextColumn _uncanonicalizedId;
  GeneratedTextColumn get uncanonicalizedId =>
      _uncanonicalizedId ??= _constructUncanonicalizedId();
  GeneratedTextColumn _constructUncanonicalizedId() {
    return GeneratedTextColumn('uncanonicalizedId', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<String>('NULL'));
  }

  @override
  List<GeneratedColumn> get $columns => [address, country, uncanonicalizedId];
  @override
  Handle get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'handle';
  @override
  final String actualTableName = 'handle';
  @override
  VerificationContext validateIntegrity(Insertable<HandleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  HandleEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return HandleEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Handle createAlias(String alias) {
    return Handle(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ChatHandleJoinData extends DataClass
    implements Insertable<ChatHandleJoinData> {
  final int chatId;
  final int handleId;
  ChatHandleJoinData({@required this.chatId, @required this.handleId});
  factory ChatHandleJoinData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ChatHandleJoinData(
      chatId: intType.mapFromDatabaseResponse(data['${effectivePrefix}chatId']),
      handleId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}handleId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
      chatId: serializer.fromJson<int>(json['chatId']),
      handleId: serializer.fromJson<int>(json['handleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<int>(chatId),
      'handleId': serializer.toJson<int>(handleId),
    };
  }

  ChatHandleJoinData copyWith({int chatId, int handleId}) => ChatHandleJoinData(
        chatId: chatId ?? this.chatId,
        handleId: handleId ?? this.handleId,
      );
  @override
  String toString() {
    return (StringBuffer('ChatHandleJoinData(')
          ..write('chatId: $chatId, ')
          ..write('handleId: $handleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(chatId.hashCode, handleId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatHandleJoinData &&
          other.chatId == this.chatId &&
          other.handleId == this.handleId);
}

class ChatHandleJoinCompanion extends UpdateCompanion<ChatHandleJoinData> {
  final Value<int> chatId;
  final Value<int> handleId;
  const ChatHandleJoinCompanion({
    this.chatId = const Value.absent(),
    this.handleId = const Value.absent(),
  });
  ChatHandleJoinCompanion.insert({
    @required int chatId,
    @required int handleId,
  })  : chatId = Value(chatId),
        handleId = Value(handleId);
  static Insertable<ChatHandleJoinData> custom({
    Expression<int> chatId,
    Expression<int> handleId,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chatId': chatId,
      if (handleId != null) 'handleId': handleId,
    });
  }

  ChatHandleJoinCompanion copyWith({Value<int> chatId, Value<int> handleId}) {
    return ChatHandleJoinCompanion(
      chatId: chatId ?? this.chatId,
      handleId: handleId ?? this.handleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
  List<GeneratedColumn> get $columns => [chatId, handleId];
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
        'FOREIGN KEY(chatId) REFERENCES chat(ROWID)',
        'FOREIGN KEY(handleId) REFERENCES handle(ROWID)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class ChatMessageJoinData extends DataClass
    implements Insertable<ChatMessageJoinData> {
  final int chatId;
  final int messageId;
  ChatMessageJoinData({@required this.chatId, @required this.messageId});
  factory ChatMessageJoinData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ChatMessageJoinData(
      chatId: intType.mapFromDatabaseResponse(data['${effectivePrefix}chatId']),
      messageId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}messageId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
      chatId: serializer.fromJson<int>(json['chatId']),
      messageId: serializer.fromJson<int>(json['messageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<int>(chatId),
      'messageId': serializer.toJson<int>(messageId),
    };
  }

  ChatMessageJoinData copyWith({int chatId, int messageId}) =>
      ChatMessageJoinData(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
      );
  @override
  String toString() {
    return (StringBuffer('ChatMessageJoinData(')
          ..write('chatId: $chatId, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(chatId.hashCode, messageId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ChatMessageJoinData &&
          other.chatId == this.chatId &&
          other.messageId == this.messageId);
}

class ChatMessageJoinCompanion extends UpdateCompanion<ChatMessageJoinData> {
  final Value<int> chatId;
  final Value<int> messageId;
  const ChatMessageJoinCompanion({
    this.chatId = const Value.absent(),
    this.messageId = const Value.absent(),
  });
  ChatMessageJoinCompanion.insert({
    @required int chatId,
    @required int messageId,
  })  : chatId = Value(chatId),
        messageId = Value(messageId);
  static Insertable<ChatMessageJoinData> custom({
    Expression<int> chatId,
    Expression<int> messageId,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chatId': chatId,
      if (messageId != null) 'messageId': messageId,
    });
  }

  ChatMessageJoinCompanion copyWith({Value<int> chatId, Value<int> messageId}) {
    return ChatMessageJoinCompanion(
      chatId: chatId ?? this.chatId,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
  List<GeneratedColumn> get $columns => [chatId, messageId];
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
        'FOREIGN KEY(chatId) REFERENCES chat(ROWID)',
        'FOREIGN KEY(messageId) REFERENCES message(ROWID)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class AttachmentEntity extends DataClass
    implements Insertable<AttachmentEntity> {
  final String guid;
  final String uti;
  final String mimeType;
  final int transferState;
  final int isOutgoing;
  final int transferName;
  final int totalBytes;
  final int isSticker;
  final int hideAttachment;
  final String blurhash;
  final int height;
  final int width;
  AttachmentEntity(
      {@required this.guid,
      @required this.uti,
      this.mimeType,
      this.transferState,
      this.isOutgoing,
      @required this.transferName,
      @required this.totalBytes,
      this.isSticker,
      this.hideAttachment,
      this.blurhash,
      this.height,
      this.width});
  factory AttachmentEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return AttachmentEntity(
      guid: stringType.mapFromDatabaseResponse(data['${effectivePrefix}guid']),
      uti: stringType.mapFromDatabaseResponse(data['${effectivePrefix}uti']),
      mimeType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}mimeType']),
      transferState: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}transferState']),
      isOutgoing:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}isOutgoing']),
      transferName: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}transferName']),
      totalBytes:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}totalBytes']),
      isSticker:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}isSticker']),
      hideAttachment: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}hideAttachment']),
      blurhash: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}blurhash']),
      height: intType.mapFromDatabaseResponse(data['${effectivePrefix}height']),
      width: intType.mapFromDatabaseResponse(data['${effectivePrefix}width']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
      map['isOutgoing'] = Variable<int>(isOutgoing);
    }
    if (!nullToAbsent || transferName != null) {
      map['transferName'] = Variable<int>(transferName);
    }
    if (!nullToAbsent || totalBytes != null) {
      map['totalBytes'] = Variable<int>(totalBytes);
    }
    if (!nullToAbsent || isSticker != null) {
      map['isSticker'] = Variable<int>(isSticker);
    }
    if (!nullToAbsent || hideAttachment != null) {
      map['hideAttachment'] = Variable<int>(hideAttachment);
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

  AttachmentCompanion toCompanion(bool nullToAbsent) {
    return AttachmentCompanion(
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
      hideAttachment: hideAttachment == null && nullToAbsent
          ? const Value.absent()
          : Value(hideAttachment),
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
      guid: serializer.fromJson<String>(json['guid']),
      uti: serializer.fromJson<String>(json['uti']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      transferState: serializer.fromJson<int>(json['transferState']),
      isOutgoing: serializer.fromJson<int>(json['isOutgoing']),
      transferName: serializer.fromJson<int>(json['transferName']),
      totalBytes: serializer.fromJson<int>(json['totalBytes']),
      isSticker: serializer.fromJson<int>(json['isSticker']),
      hideAttachment: serializer.fromJson<int>(json['hideAttachment']),
      blurhash: serializer.fromJson<String>(json['blurhash']),
      height: serializer.fromJson<int>(json['height']),
      width: serializer.fromJson<int>(json['width']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guid': serializer.toJson<String>(guid),
      'uti': serializer.toJson<String>(uti),
      'mimeType': serializer.toJson<String>(mimeType),
      'transferState': serializer.toJson<int>(transferState),
      'isOutgoing': serializer.toJson<int>(isOutgoing),
      'transferName': serializer.toJson<int>(transferName),
      'totalBytes': serializer.toJson<int>(totalBytes),
      'isSticker': serializer.toJson<int>(isSticker),
      'hideAttachment': serializer.toJson<int>(hideAttachment),
      'blurhash': serializer.toJson<String>(blurhash),
      'height': serializer.toJson<int>(height),
      'width': serializer.toJson<int>(width),
    };
  }

  AttachmentEntity copyWith(
          {String guid,
          String uti,
          String mimeType,
          int transferState,
          int isOutgoing,
          int transferName,
          int totalBytes,
          int isSticker,
          int hideAttachment,
          String blurhash,
          int height,
          int width}) =>
      AttachmentEntity(
        guid: guid ?? this.guid,
        uti: uti ?? this.uti,
        mimeType: mimeType ?? this.mimeType,
        transferState: transferState ?? this.transferState,
        isOutgoing: isOutgoing ?? this.isOutgoing,
        transferName: transferName ?? this.transferName,
        totalBytes: totalBytes ?? this.totalBytes,
        isSticker: isSticker ?? this.isSticker,
        hideAttachment: hideAttachment ?? this.hideAttachment,
        blurhash: blurhash ?? this.blurhash,
        height: height ?? this.height,
        width: width ?? this.width,
      );
  @override
  String toString() {
    return (StringBuffer('AttachmentEntity(')
          ..write('guid: $guid, ')
          ..write('uti: $uti, ')
          ..write('mimeType: $mimeType, ')
          ..write('transferState: $transferState, ')
          ..write('isOutgoing: $isOutgoing, ')
          ..write('transferName: $transferName, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('isSticker: $isSticker, ')
          ..write('hideAttachment: $hideAttachment, ')
          ..write('blurhash: $blurhash, ')
          ..write('height: $height, ')
          ..write('width: $width')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
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
                                      hideAttachment.hashCode,
                                      $mrjc(
                                          blurhash.hashCode,
                                          $mrjc(height.hashCode,
                                              width.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AttachmentEntity &&
          other.guid == this.guid &&
          other.uti == this.uti &&
          other.mimeType == this.mimeType &&
          other.transferState == this.transferState &&
          other.isOutgoing == this.isOutgoing &&
          other.transferName == this.transferName &&
          other.totalBytes == this.totalBytes &&
          other.isSticker == this.isSticker &&
          other.hideAttachment == this.hideAttachment &&
          other.blurhash == this.blurhash &&
          other.height == this.height &&
          other.width == this.width);
}

class AttachmentCompanion extends UpdateCompanion<AttachmentEntity> {
  final Value<String> guid;
  final Value<String> uti;
  final Value<String> mimeType;
  final Value<int> transferState;
  final Value<int> isOutgoing;
  final Value<int> transferName;
  final Value<int> totalBytes;
  final Value<int> isSticker;
  final Value<int> hideAttachment;
  final Value<String> blurhash;
  final Value<int> height;
  final Value<int> width;
  const AttachmentCompanion({
    this.guid = const Value.absent(),
    this.uti = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.transferState = const Value.absent(),
    this.isOutgoing = const Value.absent(),
    this.transferName = const Value.absent(),
    this.totalBytes = const Value.absent(),
    this.isSticker = const Value.absent(),
    this.hideAttachment = const Value.absent(),
    this.blurhash = const Value.absent(),
    this.height = const Value.absent(),
    this.width = const Value.absent(),
  });
  AttachmentCompanion.insert({
    @required String guid,
    @required String uti,
    this.mimeType = const Value.absent(),
    this.transferState = const Value.absent(),
    this.isOutgoing = const Value.absent(),
    @required int transferName,
    @required int totalBytes,
    this.isSticker = const Value.absent(),
    this.hideAttachment = const Value.absent(),
    this.blurhash = const Value.absent(),
    this.height = const Value.absent(),
    this.width = const Value.absent(),
  })  : guid = Value(guid),
        uti = Value(uti),
        transferName = Value(transferName),
        totalBytes = Value(totalBytes);
  static Insertable<AttachmentEntity> custom({
    Expression<String> guid,
    Expression<String> uti,
    Expression<String> mimeType,
    Expression<int> transferState,
    Expression<int> isOutgoing,
    Expression<int> transferName,
    Expression<int> totalBytes,
    Expression<int> isSticker,
    Expression<int> hideAttachment,
    Expression<String> blurhash,
    Expression<int> height,
    Expression<int> width,
  }) {
    return RawValuesInsertable({
      if (guid != null) 'guid': guid,
      if (uti != null) 'uti': uti,
      if (mimeType != null) 'mimeType': mimeType,
      if (transferState != null) 'transferState': transferState,
      if (isOutgoing != null) 'isOutgoing': isOutgoing,
      if (transferName != null) 'transferName': transferName,
      if (totalBytes != null) 'totalBytes': totalBytes,
      if (isSticker != null) 'isSticker': isSticker,
      if (hideAttachment != null) 'hideAttachment': hideAttachment,
      if (blurhash != null) 'blurhash': blurhash,
      if (height != null) 'height': height,
      if (width != null) 'width': width,
    });
  }

  AttachmentCompanion copyWith(
      {Value<String> guid,
      Value<String> uti,
      Value<String> mimeType,
      Value<int> transferState,
      Value<int> isOutgoing,
      Value<int> transferName,
      Value<int> totalBytes,
      Value<int> isSticker,
      Value<int> hideAttachment,
      Value<String> blurhash,
      Value<int> height,
      Value<int> width}) {
    return AttachmentCompanion(
      guid: guid ?? this.guid,
      uti: uti ?? this.uti,
      mimeType: mimeType ?? this.mimeType,
      transferState: transferState ?? this.transferState,
      isOutgoing: isOutgoing ?? this.isOutgoing,
      transferName: transferName ?? this.transferName,
      totalBytes: totalBytes ?? this.totalBytes,
      isSticker: isSticker ?? this.isSticker,
      hideAttachment: hideAttachment ?? this.hideAttachment,
      blurhash: blurhash ?? this.blurhash,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
      map['isOutgoing'] = Variable<int>(isOutgoing.value);
    }
    if (transferName.present) {
      map['transferName'] = Variable<int>(transferName.value);
    }
    if (totalBytes.present) {
      map['totalBytes'] = Variable<int>(totalBytes.value);
    }
    if (isSticker.present) {
      map['isSticker'] = Variable<int>(isSticker.value);
    }
    if (hideAttachment.present) {
      map['hideAttachment'] = Variable<int>(hideAttachment.value);
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
    return (StringBuffer('AttachmentCompanion(')
          ..write('guid: $guid, ')
          ..write('uti: $uti, ')
          ..write('mimeType: $mimeType, ')
          ..write('transferState: $transferState, ')
          ..write('isOutgoing: $isOutgoing, ')
          ..write('transferName: $transferName, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('isSticker: $isSticker, ')
          ..write('hideAttachment: $hideAttachment, ')
          ..write('blurhash: $blurhash, ')
          ..write('height: $height, ')
          ..write('width: $width')
          ..write(')'))
        .toString();
  }
}

class Attachment extends Table with TableInfo<Attachment, AttachmentEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  Attachment(this._db, [this._alias]);
  final VerificationMeta _guidMeta = const VerificationMeta('guid');
  GeneratedTextColumn _guid;
  GeneratedTextColumn get guid => _guid ??= _constructGuid();
  GeneratedTextColumn _constructGuid() {
    return GeneratedTextColumn('guid', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _utiMeta = const VerificationMeta('uti');
  GeneratedTextColumn _uti;
  GeneratedTextColumn get uti => _uti ??= _constructUti();
  GeneratedTextColumn _constructUti() {
    return GeneratedTextColumn('uti', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _mimeTypeMeta = const VerificationMeta('mimeType');
  GeneratedTextColumn _mimeType;
  GeneratedTextColumn get mimeType => _mimeType ??= _constructMimeType();
  GeneratedTextColumn _constructMimeType() {
    return GeneratedTextColumn('mimeType', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<String>('NULL'));
  }

  final VerificationMeta _transferStateMeta =
      const VerificationMeta('transferState');
  GeneratedIntColumn _transferState;
  GeneratedIntColumn get transferState =>
      _transferState ??= _constructTransferState();
  GeneratedIntColumn _constructTransferState() {
    return GeneratedIntColumn('transferState', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _isOutgoingMeta = const VerificationMeta('isOutgoing');
  GeneratedIntColumn _isOutgoing;
  GeneratedIntColumn get isOutgoing => _isOutgoing ??= _constructIsOutgoing();
  GeneratedIntColumn _constructIsOutgoing() {
    return GeneratedIntColumn('isOutgoing', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _transferNameMeta =
      const VerificationMeta('transferName');
  GeneratedIntColumn _transferName;
  GeneratedIntColumn get transferName =>
      _transferName ??= _constructTransferName();
  GeneratedIntColumn _constructTransferName() {
    return GeneratedIntColumn('transferName', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _totalBytesMeta = const VerificationMeta('totalBytes');
  GeneratedIntColumn _totalBytes;
  GeneratedIntColumn get totalBytes => _totalBytes ??= _constructTotalBytes();
  GeneratedIntColumn _constructTotalBytes() {
    return GeneratedIntColumn('totalBytes', $tableName, false,
        $customConstraints: 'NOT NULL');
  }

  final VerificationMeta _isStickerMeta = const VerificationMeta('isSticker');
  GeneratedIntColumn _isSticker;
  GeneratedIntColumn get isSticker => _isSticker ??= _constructIsSticker();
  GeneratedIntColumn _constructIsSticker() {
    return GeneratedIntColumn('isSticker', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _hideAttachmentMeta =
      const VerificationMeta('hideAttachment');
  GeneratedIntColumn _hideAttachment;
  GeneratedIntColumn get hideAttachment =>
      _hideAttachment ??= _constructHideAttachment();
  GeneratedIntColumn _constructHideAttachment() {
    return GeneratedIntColumn('hideAttachment', $tableName, true,
        $customConstraints: 'DEFAULT 0',
        defaultValue: const CustomExpression<int>('0'));
  }

  final VerificationMeta _blurhashMeta = const VerificationMeta('blurhash');
  GeneratedTextColumn _blurhash;
  GeneratedTextColumn get blurhash => _blurhash ??= _constructBlurhash();
  GeneratedTextColumn _constructBlurhash() {
    return GeneratedTextColumn('blurhash', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<String>('NULL'));
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  GeneratedIntColumn _height;
  GeneratedIntColumn get height => _height ??= _constructHeight();
  GeneratedIntColumn _constructHeight() {
    return GeneratedIntColumn('height', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<int>('NULL'));
  }

  final VerificationMeta _widthMeta = const VerificationMeta('width');
  GeneratedIntColumn _width;
  GeneratedIntColumn get width => _width ??= _constructWidth();
  GeneratedIntColumn _constructWidth() {
    return GeneratedIntColumn('width', $tableName, true,
        $customConstraints: 'DEFAULT NULL',
        defaultValue: const CustomExpression<int>('NULL'));
  }

  @override
  List<GeneratedColumn> get $columns => [
        guid,
        uti,
        mimeType,
        transferState,
        isOutgoing,
        transferName,
        totalBytes,
        isSticker,
        hideAttachment,
        blurhash,
        height,
        width
      ];
  @override
  Attachment get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attachment';
  @override
  final String actualTableName = 'attachment';
  @override
  VerificationContext validateIntegrity(Insertable<AttachmentEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
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
    if (data.containsKey('hideAttachment')) {
      context.handle(
          _hideAttachmentMeta,
          hideAttachment.isAcceptableOrUnknown(
              data['hideAttachment'], _hideAttachmentMeta));
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  AttachmentEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AttachmentEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Attachment createAlias(String alias) {
    return Attachment(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class AttachmentMessageJoinData extends DataClass
    implements Insertable<AttachmentMessageJoinData> {
  final int attachmentId;
  final int messageId;
  AttachmentMessageJoinData(
      {@required this.attachmentId, @required this.messageId});
  factory AttachmentMessageJoinData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return AttachmentMessageJoinData(
      attachmentId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachmentId']),
      messageId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}messageId']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
      attachmentId: serializer.fromJson<int>(json['attachmentId']),
      messageId: serializer.fromJson<int>(json['messageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'attachmentId': serializer.toJson<int>(attachmentId),
      'messageId': serializer.toJson<int>(messageId),
    };
  }

  AttachmentMessageJoinData copyWith({int attachmentId, int messageId}) =>
      AttachmentMessageJoinData(
        attachmentId: attachmentId ?? this.attachmentId,
        messageId: messageId ?? this.messageId,
      );
  @override
  String toString() {
    return (StringBuffer('AttachmentMessageJoinData(')
          ..write('attachmentId: $attachmentId, ')
          ..write('messageId: $messageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(attachmentId.hashCode, messageId.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AttachmentMessageJoinData &&
          other.attachmentId == this.attachmentId &&
          other.messageId == this.messageId);
}

class AttachmentMessageJoinCompanion
    extends UpdateCompanion<AttachmentMessageJoinData> {
  final Value<int> attachmentId;
  final Value<int> messageId;
  const AttachmentMessageJoinCompanion({
    this.attachmentId = const Value.absent(),
    this.messageId = const Value.absent(),
  });
  AttachmentMessageJoinCompanion.insert({
    @required int attachmentId,
    @required int messageId,
  })  : attachmentId = Value(attachmentId),
        messageId = Value(messageId);
  static Insertable<AttachmentMessageJoinData> custom({
    Expression<int> attachmentId,
    Expression<int> messageId,
  }) {
    return RawValuesInsertable({
      if (attachmentId != null) 'attachmentId': attachmentId,
      if (messageId != null) 'messageId': messageId,
    });
  }

  AttachmentMessageJoinCompanion copyWith(
      {Value<int> attachmentId, Value<int> messageId}) {
    return AttachmentMessageJoinCompanion(
      attachmentId: attachmentId ?? this.attachmentId,
      messageId: messageId ?? this.messageId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
  List<GeneratedColumn> get $columns => [attachmentId, messageId];
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
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
        'FOREIGN KEY(attachmentId) REFERENCES attachment(ROWID)',
        'FOREIGN KEY(messageId) REFERENCES message(ROWID)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  Chat _chat;
  Chat get chat => _chat ??= Chat(this);
  Handle _handle;
  Handle get handle => _handle ??= Handle(this);
  ChatHandleJoin _chatHandleJoin;
  ChatHandleJoin get chatHandleJoin => _chatHandleJoin ??= ChatHandleJoin(this);
  ChatMessageJoin _chatMessageJoin;
  ChatMessageJoin get chatMessageJoin =>
      _chatMessageJoin ??= ChatMessageJoin(this);
  Attachment _attachment;
  Attachment get attachment => _attachment ??= Attachment(this);
  AttachmentMessageJoin _attachmentMessageJoin;
  AttachmentMessageJoin get attachmentMessageJoin =>
      _attachmentMessageJoin ??= AttachmentMessageJoin(this);
  ChatDao _chatDao;
  ChatDao get chatDao => _chatDao ??= ChatDao(this as AppDatabase);
  MessageDao _messageDao;
  MessageDao get messageDao => _messageDao ??= MessageDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        chat,
        handle,
        chatHandleJoin,
        chatMessageJoin,
        attachment,
        attachmentMessageJoin
      ];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ChatDaoMixin on DatabaseAccessor<AppDatabase> {}
mixin _$MessageDaoMixin on DatabaseAccessor<AppDatabase> {}
mixin _$CMJDaoMixin on DatabaseAccessor<AppDatabase> {}

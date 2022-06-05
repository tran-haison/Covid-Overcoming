// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) {
  return _ChatUser.fromJson(json);
}

/// @nodoc
class _$ChatUserTearOff {
  const _$ChatUserTearOff();

  _ChatUser call(
      {required String id,
      required String photoUrl,
      required String displayName,
      required String phoneNumber,
      required String aboutMe}) {
    return _ChatUser(
      id: id,
      photoUrl: photoUrl,
      displayName: displayName,
      phoneNumber: phoneNumber,
      aboutMe: aboutMe,
    );
  }

  ChatUser fromJson(Map<String, Object?> json) {
    return ChatUser.fromJson(json);
  }
}

/// @nodoc
const $ChatUser = _$ChatUserTearOff();

/// @nodoc
mixin _$ChatUser {
  String get id => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get aboutMe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatUserCopyWith<ChatUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserCopyWith<$Res> {
  factory $ChatUserCopyWith(ChatUser value, $Res Function(ChatUser) then) =
      _$ChatUserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String photoUrl,
      String displayName,
      String phoneNumber,
      String aboutMe});
}

/// @nodoc
class _$ChatUserCopyWithImpl<$Res> implements $ChatUserCopyWith<$Res> {
  _$ChatUserCopyWithImpl(this._value, this._then);

  final ChatUser _value;
  // ignore: unused_field
  final $Res Function(ChatUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? photoUrl = freezed,
    Object? displayName = freezed,
    Object? phoneNumber = freezed,
    Object? aboutMe = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: aboutMe == freezed
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ChatUserCopyWith<$Res> implements $ChatUserCopyWith<$Res> {
  factory _$ChatUserCopyWith(_ChatUser value, $Res Function(_ChatUser) then) =
      __$ChatUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String photoUrl,
      String displayName,
      String phoneNumber,
      String aboutMe});
}

/// @nodoc
class __$ChatUserCopyWithImpl<$Res> extends _$ChatUserCopyWithImpl<$Res>
    implements _$ChatUserCopyWith<$Res> {
  __$ChatUserCopyWithImpl(_ChatUser _value, $Res Function(_ChatUser) _then)
      : super(_value, (v) => _then(v as _ChatUser));

  @override
  _ChatUser get _value => super._value as _ChatUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? photoUrl = freezed,
    Object? displayName = freezed,
    Object? phoneNumber = freezed,
    Object? aboutMe = freezed,
  }) {
    return _then(_ChatUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: aboutMe == freezed
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatUser implements _ChatUser {
  const _$_ChatUser(
      {required this.id,
      required this.photoUrl,
      required this.displayName,
      required this.phoneNumber,
      required this.aboutMe});

  factory _$_ChatUser.fromJson(Map<String, dynamic> json) =>
      _$$_ChatUserFromJson(json);

  @override
  final String id;
  @override
  final String photoUrl;
  @override
  final String displayName;
  @override
  final String phoneNumber;
  @override
  final String aboutMe;

  @override
  String toString() {
    return 'ChatUser(id: $id, photoUrl: $photoUrl, displayName: $displayName, phoneNumber: $phoneNumber, aboutMe: $aboutMe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.aboutMe, aboutMe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(aboutMe));

  @JsonKey(ignore: true)
  @override
  _$ChatUserCopyWith<_ChatUser> get copyWith =>
      __$ChatUserCopyWithImpl<_ChatUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatUserToJson(this);
  }
}

abstract class _ChatUser implements ChatUser {
  const factory _ChatUser(
      {required String id,
      required String photoUrl,
      required String displayName,
      required String phoneNumber,
      required String aboutMe}) = _$_ChatUser;

  factory _ChatUser.fromJson(Map<String, dynamic> json) = _$_ChatUser.fromJson;

  @override
  String get id;
  @override
  String get photoUrl;
  @override
  String get displayName;
  @override
  String get phoneNumber;
  @override
  String get aboutMe;
  @override
  @JsonKey(ignore: true)
  _$ChatUserCopyWith<_ChatUser> get copyWith =>
      throw _privateConstructorUsedError;
}

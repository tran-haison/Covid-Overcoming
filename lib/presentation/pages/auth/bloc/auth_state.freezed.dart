// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _AuthState call(
      {bool isLoading = false,
      User? user = null,
      bool isSignInSuccess = false,
      Error? signInError = null,
      bool isSignUpSuccess = false,
      Error? signUpError = null}) {
    return _AuthState(
      isLoading: isLoading,
      user: user,
      isSignInSuccess: isSignInSuccess,
      signInError: signInError,
      isSignUpSuccess: isSignUpSuccess,
      signUpError: signUpError,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
// Loading
  bool get isLoading => throw _privateConstructorUsedError; // User
  User? get user => throw _privateConstructorUsedError; // Sign in
  bool get isSignInSuccess => throw _privateConstructorUsedError;
  Error? get signInError => throw _privateConstructorUsedError; // Sign up
  bool get isSignUpSuccess => throw _privateConstructorUsedError;
  Error? get signUpError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      User? user,
      bool isSignInSuccess,
      Error? signInError,
      bool isSignUpSuccess,
      Error? signUpError});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? user = freezed,
    Object? isSignInSuccess = freezed,
    Object? signInError = freezed,
    Object? isSignUpSuccess = freezed,
    Object? signUpError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isSignInSuccess: isSignInSuccess == freezed
          ? _value.isSignInSuccess
          : isSignInSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      signInError: signInError == freezed
          ? _value.signInError
          : signInError // ignore: cast_nullable_to_non_nullable
              as Error?,
      isSignUpSuccess: isSignUpSuccess == freezed
          ? _value.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpError: signUpError == freezed
          ? _value.signUpError
          : signUpError // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc
abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      User? user,
      bool isSignInSuccess,
      Error? signInError,
      bool isSignUpSuccess,
      Error? signUpError});
}

/// @nodoc
class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? user = freezed,
    Object? isSignInSuccess = freezed,
    Object? signInError = freezed,
    Object? isSignUpSuccess = freezed,
    Object? signUpError = freezed,
  }) {
    return _then(_AuthState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isSignInSuccess: isSignInSuccess == freezed
          ? _value.isSignInSuccess
          : isSignInSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      signInError: signInError == freezed
          ? _value.signInError
          : signInError // ignore: cast_nullable_to_non_nullable
              as Error?,
      isSignUpSuccess: isSignUpSuccess == freezed
          ? _value.isSignUpSuccess
          : isSignUpSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpError: signUpError == freezed
          ? _value.signUpError
          : signUpError // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {this.isLoading = false,
      this.user = null,
      this.isSignInSuccess = false,
      this.signInError = null,
      this.isSignUpSuccess = false,
      this.signUpError = null});

  @JsonKey()
  @override // Loading
  final bool isLoading;
  @JsonKey()
  @override // User
  final User? user;
  @JsonKey()
  @override // Sign in
  final bool isSignInSuccess;
  @JsonKey()
  @override
  final Error? signInError;
  @JsonKey()
  @override // Sign up
  final bool isSignUpSuccess;
  @JsonKey()
  @override
  final Error? signUpError;

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, user: $user, isSignInSuccess: $isSignInSuccess, signInError: $signInError, isSignUpSuccess: $isSignUpSuccess, signUpError: $signUpError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.isSignInSuccess, isSignInSuccess) &&
            const DeepCollectionEquality()
                .equals(other.signInError, signInError) &&
            const DeepCollectionEquality()
                .equals(other.isSignUpSuccess, isSignUpSuccess) &&
            const DeepCollectionEquality()
                .equals(other.signUpError, signUpError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isSignInSuccess),
      const DeepCollectionEquality().hash(signInError),
      const DeepCollectionEquality().hash(isSignUpSuccess),
      const DeepCollectionEquality().hash(signUpError));

  @JsonKey(ignore: true)
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {bool isLoading,
      User? user,
      bool isSignInSuccess,
      Error? signInError,
      bool isSignUpSuccess,
      Error? signUpError}) = _$_AuthState;

  @override // Loading
  bool get isLoading;
  @override // User
  User? get user;
  @override // Sign in
  bool get isSignInSuccess;
  @override
  Error? get signInError;
  @override // Sign up
  bool get isSignUpSuccess;
  @override
  Error? get signUpError;
  @override
  @JsonKey(ignore: true)
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

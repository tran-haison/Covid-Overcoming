// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {bool isLoading = false,
      List<Stage>? stages = null,
      Error? stagesError = null}) {
    return _HomeState(
      isLoading: isLoading,
      stages: stages,
      stagesError: stagesError,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
// Loading
  bool get isLoading => throw _privateConstructorUsedError; // List of stages
  List<Stage>? get stages => throw _privateConstructorUsedError;
  Error? get stagesError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, List<Stage>? stages, Error? stagesError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? stages = freezed,
    Object? stagesError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      stages: stages == freezed
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<Stage>?,
      stagesError: stagesError == freezed
          ? _value.stagesError
          : stagesError // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, List<Stage>? stages, Error? stagesError});
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? stages = freezed,
    Object? stagesError = freezed,
  }) {
    return _then(_HomeState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      stages: stages == freezed
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<Stage>?,
      stagesError: stagesError == freezed
          ? _value.stagesError
          : stagesError // ignore: cast_nullable_to_non_nullable
              as Error?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.isLoading = false, this.stages = null, this.stagesError = null});

  @JsonKey()
  @override // Loading
  final bool isLoading;
  @JsonKey()
  @override // List of stages
  final List<Stage>? stages;
  @JsonKey()
  @override
  final Error? stagesError;

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, stages: $stages, stagesError: $stagesError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.stages, stages) &&
            const DeepCollectionEquality()
                .equals(other.stagesError, stagesError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(stages),
      const DeepCollectionEquality().hash(stagesError));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {bool isLoading, List<Stage>? stages, Error? stagesError}) = _$_HomeState;

  @override // Loading
  bool get isLoading;
  @override // List of stages
  List<Stage>? get stages;
  @override
  Error? get stagesError;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

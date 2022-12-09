// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'duration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DurationState _$DurationStateFromJson(Map<String, dynamic> json) {
  return _DurationState.fromJson(json);
}

/// @nodoc
mixin _$DurationState {
  String get text => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationStateCopyWith<DurationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationStateCopyWith<$Res> {
  factory $DurationStateCopyWith(
          DurationState value, $Res Function(DurationState) then) =
      _$DurationStateCopyWithImpl<$Res, DurationState>;
  @useResult
  $Res call({String text, int value});
}

/// @nodoc
class _$DurationStateCopyWithImpl<$Res, $Val extends DurationState>
    implements $DurationStateCopyWith<$Res> {
  _$DurationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DurationStateCopyWith<$Res>
    implements $DurationStateCopyWith<$Res> {
  factory _$$_DurationStateCopyWith(
          _$_DurationState value, $Res Function(_$_DurationState) then) =
      __$$_DurationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int value});
}

/// @nodoc
class __$$_DurationStateCopyWithImpl<$Res>
    extends _$DurationStateCopyWithImpl<$Res, _$_DurationState>
    implements _$$_DurationStateCopyWith<$Res> {
  __$$_DurationStateCopyWithImpl(
      _$_DurationState _value, $Res Function(_$_DurationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? value = null,
  }) {
    return _then(_$_DurationState(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DurationState extends _DurationState {
  _$_DurationState({this.text = "", this.value = 0}) : super._();

  factory _$_DurationState.fromJson(Map<String, dynamic> json) =>
      _$$_DurationStateFromJson(json);

  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'DurationState(text: $text, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DurationState &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DurationStateCopyWith<_$_DurationState> get copyWith =>
      __$$_DurationStateCopyWithImpl<_$_DurationState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DurationStateToJson(
      this,
    );
  }
}

abstract class _DurationState extends DurationState {
  factory _DurationState({final String text, final int value}) =
      _$_DurationState;
  _DurationState._() : super._();

  factory _DurationState.fromJson(Map<String, dynamic> json) =
      _$_DurationState.fromJson;

  @override
  String get text;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_DurationStateCopyWith<_$_DurationState> get copyWith =>
      throw _privateConstructorUsedError;
}

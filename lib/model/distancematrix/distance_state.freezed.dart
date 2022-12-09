// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'distance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DistanceState _$DistanceStateFromJson(Map<String, dynamic> json) {
  return _DistanceState.fromJson(json);
}

/// @nodoc
mixin _$DistanceState {
  String get text => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistanceStateCopyWith<DistanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistanceStateCopyWith<$Res> {
  factory $DistanceStateCopyWith(
          DistanceState value, $Res Function(DistanceState) then) =
      _$DistanceStateCopyWithImpl<$Res, DistanceState>;
  @useResult
  $Res call({String text, int value});
}

/// @nodoc
class _$DistanceStateCopyWithImpl<$Res, $Val extends DistanceState>
    implements $DistanceStateCopyWith<$Res> {
  _$DistanceStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_DistanceStateCopyWith<$Res>
    implements $DistanceStateCopyWith<$Res> {
  factory _$$_DistanceStateCopyWith(
          _$_DistanceState value, $Res Function(_$_DistanceState) then) =
      __$$_DistanceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int value});
}

/// @nodoc
class __$$_DistanceStateCopyWithImpl<$Res>
    extends _$DistanceStateCopyWithImpl<$Res, _$_DistanceState>
    implements _$$_DistanceStateCopyWith<$Res> {
  __$$_DistanceStateCopyWithImpl(
      _$_DistanceState _value, $Res Function(_$_DistanceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? value = null,
  }) {
    return _then(_$_DistanceState(
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
class _$_DistanceState extends _DistanceState {
  _$_DistanceState({this.text = "", this.value = 0}) : super._();

  factory _$_DistanceState.fromJson(Map<String, dynamic> json) =>
      _$$_DistanceStateFromJson(json);

  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'DistanceState(text: $text, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DistanceState &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistanceStateCopyWith<_$_DistanceState> get copyWith =>
      __$$_DistanceStateCopyWithImpl<_$_DistanceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistanceStateToJson(
      this,
    );
  }
}

abstract class _DistanceState extends DistanceState {
  factory _DistanceState({final String text, final int value}) =
      _$_DistanceState;
  _DistanceState._() : super._();

  factory _DistanceState.fromJson(Map<String, dynamic> json) =
      _$_DistanceState.fromJson;

  @override
  String get text;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_DistanceStateCopyWith<_$_DistanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

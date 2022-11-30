// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'matrix_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatrixState _$MatrixStateFromJson(Map<String, dynamic> json) {
  return _MatrixState.fromJson(json);
}

/// @nodoc
mixin _$MatrixState {
  DistanceState get distance => throw _privateConstructorUsedError;
  DurationState get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatrixStateCopyWith<MatrixState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatrixStateCopyWith<$Res> {
  factory $MatrixStateCopyWith(
          MatrixState value, $Res Function(MatrixState) then) =
      _$MatrixStateCopyWithImpl<$Res, MatrixState>;
  @useResult
  $Res call({DistanceState distance, DurationState duration});

  $DistanceStateCopyWith<$Res> get distance;
  $DurationStateCopyWith<$Res> get duration;
}

/// @nodoc
class _$MatrixStateCopyWithImpl<$Res, $Val extends MatrixState>
    implements $MatrixStateCopyWith<$Res> {
  _$MatrixStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as DistanceState,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DistanceStateCopyWith<$Res> get distance {
    return $DistanceStateCopyWith<$Res>(_value.distance, (value) {
      return _then(_value.copyWith(distance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationStateCopyWith<$Res> get duration {
    return $DurationStateCopyWith<$Res>(_value.duration, (value) {
      return _then(_value.copyWith(duration: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MatrixStateCopyWith<$Res>
    implements $MatrixStateCopyWith<$Res> {
  factory _$$_MatrixStateCopyWith(
          _$_MatrixState value, $Res Function(_$_MatrixState) then) =
      __$$_MatrixStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DistanceState distance, DurationState duration});

  @override
  $DistanceStateCopyWith<$Res> get distance;
  @override
  $DurationStateCopyWith<$Res> get duration;
}

/// @nodoc
class __$$_MatrixStateCopyWithImpl<$Res>
    extends _$MatrixStateCopyWithImpl<$Res, _$_MatrixState>
    implements _$$_MatrixStateCopyWith<$Res> {
  __$$_MatrixStateCopyWithImpl(
      _$_MatrixState _value, $Res Function(_$_MatrixState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_$_MatrixState(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as DistanceState,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as DurationState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatrixState extends _MatrixState {
  _$_MatrixState({required this.distance, required this.duration}) : super._();

  factory _$_MatrixState.fromJson(Map<String, dynamic> json) =>
      _$$_MatrixStateFromJson(json);

  @override
  final DistanceState distance;
  @override
  final DurationState duration;

  @override
  String toString() {
    return 'MatrixState(distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatrixState &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distance, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatrixStateCopyWith<_$_MatrixState> get copyWith =>
      __$$_MatrixStateCopyWithImpl<_$_MatrixState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatrixStateToJson(
      this,
    );
  }
}

abstract class _MatrixState extends MatrixState {
  factory _MatrixState(
      {required final DistanceState distance,
      required final DurationState duration}) = _$_MatrixState;
  _MatrixState._() : super._();

  factory _MatrixState.fromJson(Map<String, dynamic> json) =
      _$_MatrixState.fromJson;

  @override
  DistanceState get distance;
  @override
  DurationState get duration;
  @override
  @JsonKey(ignore: true)
  _$$_MatrixStateCopyWith<_$_MatrixState> get copyWith =>
      throw _privateConstructorUsedError;
}

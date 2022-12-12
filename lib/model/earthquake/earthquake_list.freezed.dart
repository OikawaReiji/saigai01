// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'earthquake_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EarthquakeList _$EarthquakeListFromJson(Map<String, dynamic> json) {
  return _EarthquakeList.fromJson(json);
}

/// @nodoc
mixin _$EarthquakeList {
  List<Earthquake> get objects => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_cursor')
  String get nextCursor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarthquakeListCopyWith<EarthquakeList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarthquakeListCopyWith<$Res> {
  factory $EarthquakeListCopyWith(
          EarthquakeList value, $Res Function(EarthquakeList) then) =
      _$EarthquakeListCopyWithImpl<$Res, EarthquakeList>;
  @useResult
  $Res call(
      {List<Earthquake> objects,
      @JsonKey(name: 'next_cursor') String nextCursor});
}

/// @nodoc
class _$EarthquakeListCopyWithImpl<$Res, $Val extends EarthquakeList>
    implements $EarthquakeListCopyWith<$Res> {
  _$EarthquakeListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = null,
    Object? nextCursor = null,
  }) {
    return _then(_value.copyWith(
      objects: null == objects
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<Earthquake>,
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EarthquakeListCopyWith<$Res>
    implements $EarthquakeListCopyWith<$Res> {
  factory _$$_EarthquakeListCopyWith(
          _$_EarthquakeList value, $Res Function(_$_EarthquakeList) then) =
      __$$_EarthquakeListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Earthquake> objects,
      @JsonKey(name: 'next_cursor') String nextCursor});
}

/// @nodoc
class __$$_EarthquakeListCopyWithImpl<$Res>
    extends _$EarthquakeListCopyWithImpl<$Res, _$_EarthquakeList>
    implements _$$_EarthquakeListCopyWith<$Res> {
  __$$_EarthquakeListCopyWithImpl(
      _$_EarthquakeList _value, $Res Function(_$_EarthquakeList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objects = null,
    Object? nextCursor = null,
  }) {
    return _then(_$_EarthquakeList(
      objects: null == objects
          ? _value._objects
          : objects // ignore: cast_nullable_to_non_nullable
              as List<Earthquake>,
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EarthquakeList extends _EarthquakeList {
  _$_EarthquakeList(
      {final List<Earthquake> objects = const [],
      @JsonKey(name: 'next_cursor') required this.nextCursor})
      : _objects = objects,
        super._();

  factory _$_EarthquakeList.fromJson(Map<String, dynamic> json) =>
      _$$_EarthquakeListFromJson(json);

  final List<Earthquake> _objects;
  @override
  @JsonKey()
  List<Earthquake> get objects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objects);
  }

  @override
  @JsonKey(name: 'next_cursor')
  final String nextCursor;

  @override
  String toString() {
    return 'EarthquakeList(objects: $objects, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EarthquakeList &&
            const DeepCollectionEquality().equals(other._objects, _objects) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_objects), nextCursor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EarthquakeListCopyWith<_$_EarthquakeList> get copyWith =>
      __$$_EarthquakeListCopyWithImpl<_$_EarthquakeList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EarthquakeListToJson(
      this,
    );
  }
}

abstract class _EarthquakeList extends EarthquakeList {
  factory _EarthquakeList(
          {final List<Earthquake> objects,
          @JsonKey(name: 'next_cursor') required final String nextCursor}) =
      _$_EarthquakeList;
  _EarthquakeList._() : super._();

  factory _EarthquakeList.fromJson(Map<String, dynamic> json) =
      _$_EarthquakeList.fromJson;

  @override
  List<Earthquake> get objects;
  @override
  @JsonKey(name: 'next_cursor')
  String get nextCursor;
  @override
  @JsonKey(ignore: true)
  _$$_EarthquakeListCopyWith<_$_EarthquakeList> get copyWith =>
      throw _privateConstructorUsedError;
}

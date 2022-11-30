// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shellter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShellterList _$ShellterListFromJson(Map<String, dynamic> json) {
  return _ShellterList.fromJson(json);
}

/// @nodoc
mixin _$ShellterList {
  List<Features> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShellterListCopyWith<ShellterList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShellterListCopyWith<$Res> {
  factory $ShellterListCopyWith(
          ShellterList value, $Res Function(ShellterList) then) =
      _$ShellterListCopyWithImpl<$Res, ShellterList>;
  @useResult
  $Res call({List<Features> features});
}

/// @nodoc
class _$ShellterListCopyWithImpl<$Res, $Val extends ShellterList>
    implements $ShellterListCopyWith<$Res> {
  _$ShellterListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Features>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShellterListCopyWith<$Res>
    implements $ShellterListCopyWith<$Res> {
  factory _$$_ShellterListCopyWith(
          _$_ShellterList value, $Res Function(_$_ShellterList) then) =
      __$$_ShellterListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Features> features});
}

/// @nodoc
class __$$_ShellterListCopyWithImpl<$Res>
    extends _$ShellterListCopyWithImpl<$Res, _$_ShellterList>
    implements _$$_ShellterListCopyWith<$Res> {
  __$$_ShellterListCopyWithImpl(
      _$_ShellterList _value, $Res Function(_$_ShellterList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$_ShellterList(
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<Features>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShellterList implements _ShellterList {
  const _$_ShellterList({required final List<Features> features})
      : _features = features;

  factory _$_ShellterList.fromJson(Map<String, dynamic> json) =>
      _$$_ShellterListFromJson(json);

  final List<Features> _features;
  @override
  List<Features> get features {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'ShellterList(features: $features)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShellterList &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShellterListCopyWith<_$_ShellterList> get copyWith =>
      __$$_ShellterListCopyWithImpl<_$_ShellterList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShellterListToJson(
      this,
    );
  }
}

abstract class _ShellterList implements ShellterList {
  const factory _ShellterList({required final List<Features> features}) =
      _$_ShellterList;

  factory _ShellterList.fromJson(Map<String, dynamic> json) =
      _$_ShellterList.fromJson;

  @override
  List<Features> get features;
  @override
  @JsonKey(ignore: true)
  _$$_ShellterListCopyWith<_$_ShellterList> get copyWith =>
      throw _privateConstructorUsedError;
}

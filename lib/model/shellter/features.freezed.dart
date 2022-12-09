// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'features.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return _Features.fromJson(json);
}

/// @nodoc
mixin _$Features {
  String get type => throw _privateConstructorUsedError;
  Geo get geometry => throw _privateConstructorUsedError;
  Properties get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturesCopyWith<Features> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturesCopyWith<$Res> {
  factory $FeaturesCopyWith(Features value, $Res Function(Features) then) =
      _$FeaturesCopyWithImpl<$Res, Features>;
  @useResult
  $Res call({String type, Geo geometry, Properties properties});

  $GeoCopyWith<$Res> get geometry;
  $PropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$FeaturesCopyWithImpl<$Res, $Val extends Features>
    implements $FeaturesCopyWith<$Res> {
  _$FeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? geometry = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geo,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoCopyWith<$Res> get geometry {
    return $GeoCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PropertiesCopyWith<$Res> get properties {
    return $PropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeaturesCopyWith<$Res> implements $FeaturesCopyWith<$Res> {
  factory _$$_FeaturesCopyWith(
          _$_Features value, $Res Function(_$_Features) then) =
      __$$_FeaturesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, Geo geometry, Properties properties});

  @override
  $GeoCopyWith<$Res> get geometry;
  @override
  $PropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$_FeaturesCopyWithImpl<$Res>
    extends _$FeaturesCopyWithImpl<$Res, _$_Features>
    implements _$$_FeaturesCopyWith<$Res> {
  __$$_FeaturesCopyWithImpl(
      _$_Features _value, $Res Function(_$_Features) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? geometry = null,
    Object? properties = null,
  }) {
    return _then(_$_Features(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geo,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as Properties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Features implements _Features {
  const _$_Features(
      {required this.type, required this.geometry, required this.properties});

  factory _$_Features.fromJson(Map<String, dynamic> json) =>
      _$$_FeaturesFromJson(json);

  @override
  final String type;
  @override
  final Geo geometry;
  @override
  final Properties properties;

  @override
  String toString() {
    return 'Features(type: $type, geometry: $geometry, properties: $properties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Features &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, geometry, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeaturesCopyWith<_$_Features> get copyWith =>
      __$$_FeaturesCopyWithImpl<_$_Features>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeaturesToJson(
      this,
    );
  }
}

abstract class _Features implements Features {
  const factory _Features(
      {required final String type,
      required final Geo geometry,
      required final Properties properties}) = _$_Features;

  factory _Features.fromJson(Map<String, dynamic> json) = _$_Features.fromJson;

  @override
  String get type;
  @override
  Geo get geometry;
  @override
  Properties get properties;
  @override
  @JsonKey(ignore: true)
  _$$_FeaturesCopyWith<_$_Features> get copyWith =>
      throw _privateConstructorUsedError;
}

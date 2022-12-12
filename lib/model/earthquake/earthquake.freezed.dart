// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'earthquake.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Earthquake _$EarthquakeFromJson(Map<String, dynamic> json) {
  return _Earthquake.fromJson(json);
}

/// @nodoc
mixin _$Earthquake {
  @JsonKey(name: 'Hypocenter')
  String get hypocenter => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxInt')
  String get maxInt => throw _privateConstructorUsedError;
  @JsonKey(name: 'OriginDateTime')
  String get originDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Magnitude')
  String get magnitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportDateTime')
  String get reportDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'EventID')
  String get eventID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarthquakeCopyWith<Earthquake> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarthquakeCopyWith<$Res> {
  factory $EarthquakeCopyWith(
          Earthquake value, $Res Function(Earthquake) then) =
      _$EarthquakeCopyWithImpl<$Res, Earthquake>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Hypocenter') String hypocenter,
      @JsonKey(name: 'MaxInt') String maxInt,
      @JsonKey(name: 'OriginDateTime') String originDateTime,
      @JsonKey(name: 'Magnitude') String magnitude,
      @JsonKey(name: 'ReportDateTime') String reportDateTime,
      @JsonKey(name: 'EventID') String eventID});
}

/// @nodoc
class _$EarthquakeCopyWithImpl<$Res, $Val extends Earthquake>
    implements $EarthquakeCopyWith<$Res> {
  _$EarthquakeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hypocenter = null,
    Object? maxInt = null,
    Object? originDateTime = null,
    Object? magnitude = null,
    Object? reportDateTime = null,
    Object? eventID = null,
  }) {
    return _then(_value.copyWith(
      hypocenter: null == hypocenter
          ? _value.hypocenter
          : hypocenter // ignore: cast_nullable_to_non_nullable
              as String,
      maxInt: null == maxInt
          ? _value.maxInt
          : maxInt // ignore: cast_nullable_to_non_nullable
              as String,
      originDateTime: null == originDateTime
          ? _value.originDateTime
          : originDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      magnitude: null == magnitude
          ? _value.magnitude
          : magnitude // ignore: cast_nullable_to_non_nullable
              as String,
      reportDateTime: null == reportDateTime
          ? _value.reportDateTime
          : reportDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      eventID: null == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EarthquakeCopyWith<$Res>
    implements $EarthquakeCopyWith<$Res> {
  factory _$$_EarthquakeCopyWith(
          _$_Earthquake value, $Res Function(_$_Earthquake) then) =
      __$$_EarthquakeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Hypocenter') String hypocenter,
      @JsonKey(name: 'MaxInt') String maxInt,
      @JsonKey(name: 'OriginDateTime') String originDateTime,
      @JsonKey(name: 'Magnitude') String magnitude,
      @JsonKey(name: 'ReportDateTime') String reportDateTime,
      @JsonKey(name: 'EventID') String eventID});
}

/// @nodoc
class __$$_EarthquakeCopyWithImpl<$Res>
    extends _$EarthquakeCopyWithImpl<$Res, _$_Earthquake>
    implements _$$_EarthquakeCopyWith<$Res> {
  __$$_EarthquakeCopyWithImpl(
      _$_Earthquake _value, $Res Function(_$_Earthquake) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hypocenter = null,
    Object? maxInt = null,
    Object? originDateTime = null,
    Object? magnitude = null,
    Object? reportDateTime = null,
    Object? eventID = null,
  }) {
    return _then(_$_Earthquake(
      hypocenter: null == hypocenter
          ? _value.hypocenter
          : hypocenter // ignore: cast_nullable_to_non_nullable
              as String,
      maxInt: null == maxInt
          ? _value.maxInt
          : maxInt // ignore: cast_nullable_to_non_nullable
              as String,
      originDateTime: null == originDateTime
          ? _value.originDateTime
          : originDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      magnitude: null == magnitude
          ? _value.magnitude
          : magnitude // ignore: cast_nullable_to_non_nullable
              as String,
      reportDateTime: null == reportDateTime
          ? _value.reportDateTime
          : reportDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      eventID: null == eventID
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Earthquake extends _Earthquake {
  _$_Earthquake(
      {@JsonKey(name: 'Hypocenter') required this.hypocenter,
      @JsonKey(name: 'MaxInt') required this.maxInt,
      @JsonKey(name: 'OriginDateTime') required this.originDateTime,
      @JsonKey(name: 'Magnitude') required this.magnitude,
      @JsonKey(name: 'ReportDateTime') required this.reportDateTime,
      @JsonKey(name: 'EventID') required this.eventID})
      : super._();

  factory _$_Earthquake.fromJson(Map<String, dynamic> json) =>
      _$$_EarthquakeFromJson(json);

  @override
  @JsonKey(name: 'Hypocenter')
  final String hypocenter;
  @override
  @JsonKey(name: 'MaxInt')
  final String maxInt;
  @override
  @JsonKey(name: 'OriginDateTime')
  final String originDateTime;
  @override
  @JsonKey(name: 'Magnitude')
  final String magnitude;
  @override
  @JsonKey(name: 'ReportDateTime')
  final String reportDateTime;
  @override
  @JsonKey(name: 'EventID')
  final String eventID;

  @override
  String toString() {
    return 'Earthquake(hypocenter: $hypocenter, maxInt: $maxInt, originDateTime: $originDateTime, magnitude: $magnitude, reportDateTime: $reportDateTime, eventID: $eventID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Earthquake &&
            (identical(other.hypocenter, hypocenter) ||
                other.hypocenter == hypocenter) &&
            (identical(other.maxInt, maxInt) || other.maxInt == maxInt) &&
            (identical(other.originDateTime, originDateTime) ||
                other.originDateTime == originDateTime) &&
            (identical(other.magnitude, magnitude) ||
                other.magnitude == magnitude) &&
            (identical(other.reportDateTime, reportDateTime) ||
                other.reportDateTime == reportDateTime) &&
            (identical(other.eventID, eventID) || other.eventID == eventID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hypocenter, maxInt,
      originDateTime, magnitude, reportDateTime, eventID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EarthquakeCopyWith<_$_Earthquake> get copyWith =>
      __$$_EarthquakeCopyWithImpl<_$_Earthquake>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EarthquakeToJson(
      this,
    );
  }
}

abstract class _Earthquake extends Earthquake {
  factory _Earthquake(
      {@JsonKey(name: 'Hypocenter') required final String hypocenter,
      @JsonKey(name: 'MaxInt') required final String maxInt,
      @JsonKey(name: 'OriginDateTime') required final String originDateTime,
      @JsonKey(name: 'Magnitude') required final String magnitude,
      @JsonKey(name: 'ReportDateTime') required final String reportDateTime,
      @JsonKey(name: 'EventID') required final String eventID}) = _$_Earthquake;
  _Earthquake._() : super._();

  factory _Earthquake.fromJson(Map<String, dynamic> json) =
      _$_Earthquake.fromJson;

  @override
  @JsonKey(name: 'Hypocenter')
  String get hypocenter;
  @override
  @JsonKey(name: 'MaxInt')
  String get maxInt;
  @override
  @JsonKey(name: 'OriginDateTime')
  String get originDateTime;
  @override
  @JsonKey(name: 'Magnitude')
  String get magnitude;
  @override
  @JsonKey(name: 'ReportDateTime')
  String get reportDateTime;
  @override
  @JsonKey(name: 'EventID')
  String get eventID;
  @override
  @JsonKey(ignore: true)
  _$$_EarthquakeCopyWith<_$_Earthquake> get copyWith =>
      throw _privateConstructorUsedError;
}

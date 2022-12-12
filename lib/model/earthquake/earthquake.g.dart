// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Earthquake _$$_EarthquakeFromJson(Map<String, dynamic> json) =>
    _$_Earthquake(
      hypocenter: json['Hypocenter'] as String,
      maxInt: json['MaxInt'] as String,
      originDateTime: json['OriginDateTime'] as String,
      magnitude: json['Magnitude'] as String,
      reportDateTime: json['ReportDateTime'] as String,
      eventID: json['EventID'] as String,
    );

Map<String, dynamic> _$$_EarthquakeToJson(_$_Earthquake instance) =>
    <String, dynamic>{
      'Hypocenter': instance.hypocenter,
      'MaxInt': instance.maxInt,
      'OriginDateTime': instance.originDateTime,
      'Magnitude': instance.magnitude,
      'ReportDateTime': instance.reportDateTime,
      'EventID': instance.eventID,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geo _$$_GeoFromJson(Map<String, dynamic> json) => _$_Geo(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      distance: (json['distance'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_GeoToJson(_$_Geo instance) => <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
      'distance': instance.distance,
    };

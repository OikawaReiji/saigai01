// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earthquake_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EarthquakeList _$$_EarthquakeListFromJson(Map<String, dynamic> json) =>
    _$_EarthquakeList(
      objects: (json['objects'] as List<dynamic>?)
              ?.map((e) => Earthquake.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nextCursor: json['next_cursor'] as String,
    );

Map<String, dynamic> _$$_EarthquakeListToJson(_$_EarthquakeList instance) =>
    <String, dynamic>{
      'objects': instance.objects,
      'next_cursor': instance.nextCursor,
    };

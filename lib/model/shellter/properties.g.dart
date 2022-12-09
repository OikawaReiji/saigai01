// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Properties _$$_PropertiesFromJson(Map<String, dynamic> json) =>
    _$_Properties(
      name: json['指定緊急避難場所'] as String,
      location: json['所在地'] as String,
      flood: json['洪水'] as String,
      landslide: json['がけ崩れ、土石流及び地滑り'] as String,
      surge: json['高潮'] as String,
      earthquake: json['地震'] as String,
      tsunami: json['津波'] as String,
      fire: json['大規模な火事'] as String,
      inlandFlood: json['内水氾濫'] as String,
      volcano: json['火山現象'] as String,
    );

Map<String, dynamic> _$$_PropertiesToJson(_$_Properties instance) =>
    <String, dynamic>{
      '指定緊急避難場所': instance.name,
      '所在地': instance.location,
      '洪水': instance.flood,
      'がけ崩れ、土石流及び地滑り': instance.landslide,
      '高潮': instance.surge,
      '地震': instance.earthquake,
      '津波': instance.tsunami,
      '大規模な火事': instance.fire,
      '内水氾濫': instance.inlandFlood,
      '火山現象': instance.volcano,
    };

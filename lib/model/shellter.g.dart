// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shellter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShellterList _$$_ShellterListFromJson(Map<String, dynamic> json) =>
    _$_ShellterList(
      features: (json['features'] as List<dynamic>)
          .map((e) => Features.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ShellterListToJson(_$_ShellterList instance) =>
    <String, dynamic>{
      'features': instance.features,
    };

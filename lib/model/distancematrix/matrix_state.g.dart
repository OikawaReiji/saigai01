// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatrixState _$$_MatrixStateFromJson(Map<String, dynamic> json) =>
    _$_MatrixState(
      distance:
          DistanceState.fromJson(json['distance'] as Map<String, dynamic>),
      duration:
          DurationState.fromJson(json['duration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MatrixStateToJson(_$_MatrixState instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
    };

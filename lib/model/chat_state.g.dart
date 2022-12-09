// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatState _$$_ChatStateFromJson(Map<String, dynamic> json) => _$_ChatState(
      registeTime:
          const TimestampConverter().fromJson(json['registeTime'] as Timestamp),
      sender: json['sender'] as String? ?? "",
      receiver: json['receiver'] as String? ?? "",
      text: json['text'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      imageFlg: json['imageFlg'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ChatStateToJson(_$_ChatState instance) =>
    <String, dynamic>{
      'registeTime': const TimestampConverter().toJson(instance.registeTime),
      'sender': instance.sender,
      'receiver': instance.receiver,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'imageFlg': instance.imageFlg,
    };

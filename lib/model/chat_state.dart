import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constant/timestamp_converter.dart';
part 'chat_state.freezed.dart';
part 'chat_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class ChatState with _$ChatState {
  const ChatState._();
  factory ChatState({
    @TimestampConverter() required DateTime registeTime,
    @Default("") String sender,
    @Default("") String receiver,
    @Default("") String text,
    @Default("") String imageUrl,
    @Default(false) bool imageFlg,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}

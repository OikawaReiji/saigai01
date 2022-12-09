import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_state.freezed.dart';
part 'user_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class UserState with _$UserState {
  const UserState._();
  factory UserState({
    @Default("") String email,
    @Default("") String uid,
    @Default("") String name,
    @Default("") String phone,
  }) = _UserState;
  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

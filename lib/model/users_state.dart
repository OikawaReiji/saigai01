import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';
part 'users_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class UsersState with _$UsersState {
  const UsersState._();
  factory UsersState({
    @Default("") String email,
    @Default("") String uid,
    @Default("") String name,
    @Default("") String address,
    @Default([]) List friends,
    @Default("") String phone,
    @Default("") String status,
    @Default("") String profileImage,
    @Default("") String headerImage,
    @Default(true) bool notificationFlg,
  }) = _UsersState;

  factory UsersState.fromJson(Map<String, dynamic> json) =>
      _$UsersStateFromJson(json);
}

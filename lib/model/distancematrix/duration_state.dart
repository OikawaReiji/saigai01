import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_state.freezed.dart';
part 'duration_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class DurationState with _$DurationState {
  const DurationState._();
  factory DurationState({
    @Default("") String text,
    @Default(0) int value,
  }) = _DurationState;

  factory DurationState.fromJson(Map<String, dynamic> json) =>
      _$DurationStateFromJson(json);
}

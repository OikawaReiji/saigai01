import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_state.freezed.dart';
part 'distance_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class DistanceState with _$DistanceState {
  const DistanceState._();
  factory DistanceState({
    @Default("") String text,
    @Default(0) int value,
  }) = _DistanceState;

  factory DistanceState.fromJson(Map<String, dynamic> json) =>
      _$DistanceStateFromJson(json);
}

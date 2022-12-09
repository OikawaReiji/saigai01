import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_state.freezed.dart';
part 'map_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MapState with _$MapState {
  const MapState._();
  factory MapState({
    @Default(0) double latitude,
    @Default(0) double longitude,
  }) = _MapState;

  factory MapState.fromJson(Map<String, dynamic> json) =>
      _$MapStateFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saigai01/model/distancematrix/distance_state.dart';
import 'package:saigai01/model/distancematrix/duration_state.dart';

part 'matrix_state.freezed.dart';
part 'matrix_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MatrixState with _$MatrixState {
  const MatrixState._();
  factory MatrixState({
    required DistanceState distance,
    required DurationState duration,
  }) = _MatrixState;

  factory MatrixState.fromJson(Map<String, dynamic> json) =>
      _$MatrixStateFromJson(json);
}

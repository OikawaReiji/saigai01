import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/model/distancematrix/distance_state.dart';
import 'package:saigai01/model/distancematrix/duration_state.dart';
import 'package:saigai01/model/distancematrix/matrix_state.dart';
import 'package:saigai01/repository/map_repository.dart';

class MatrixController extends StateNotifier<MatrixState> {
  final Ref ref;

  MatrixController(this.ref)
      : super(
          MatrixState(
            distance: DistanceState(),
            duration: DurationState(),
          ),
        );

  Future<void> fechDistanceMatrix(
      PointLatLng destinations, PointLatLng start) async {
    final result = await ref
        .read(mapRepositoryProvider)
        .fechDistanceMatrix(destinations, start);
    if (result != null) state = result;
  }
}

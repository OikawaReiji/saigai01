import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/repository/polyline_repository.dart';
import '../provider/general_provider.dart';

class PolylineController extends StateNotifier<List<PointLatLng>> {
  final Ref ref;
  PolylineController(this.ref) : super([]) {
    Timer.periodic(const Duration(seconds: 1), (t) async {
      final mapVeiwState = ref.read(mapNaviProvider);

      if (mapVeiwState == MapNavi.navigation) {
        final location = ref.read(realTimeLocationCTLProvider);
        final shellter = ref.read(navigatingShellterProvider);
        if (location.latitude != 0.0 && location.longitude != 0.0) {
          await feachPolyline(
            PointLatLng(
              location.latitude,
              location.longitude,
            ),
            PointLatLng(
              shellter!.geometry.coordinates[1],
              shellter.geometry.coordinates[0],
            ),
          );
        }
      }
    });
  }

  Future<void> feachPolyline(
    PointLatLng origin,
    PointLatLng destination,
  ) async {
    state = await ref.read(polylineRepository).getPolyline(origin, destination);
  }

  void resetPolyline() {
    state = [];
  }
}

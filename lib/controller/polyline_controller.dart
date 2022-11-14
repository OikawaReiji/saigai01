import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/repository/polyline_repository.dart';
import '../provider/general_provider.dart';

class PolylineController extends StateNotifier<PolylineResult> {
  final Ref ref;
  PolylineController(this.ref) : super(PolylineResult()) {
    Timer.periodic(const Duration(seconds: 1), (t) async {
      final mapVeiwState = ref.read(mapNaviProvider);
      final shellter = ref.read(navigatingShellterProvider);
      final location = ref.read(realTimeLocationCTLProvider);
      if (mapVeiwState == MapNavi.navigation) {
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
    });
  }

  Future<void> feachPolyline(
    PointLatLng origin,
    PointLatLng destination,
  ) async {
    state = await ref.read(polylineRepository).getPolyline(origin, destination);
  }

  void resetPolyline() {
    state = PolylineResult();
  }
}

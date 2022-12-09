import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/map/map_state.dart';
import '../provider/general_provider.dart';

class RealTimeLocationController extends StateNotifier<MapState> {
  final Ref ref;
  late StreamSubscription<Position> locationSubscription;

  RealTimeLocationController(this.ref) : super(MapState()) {
    locationSubscription =
        Geolocator.getPositionStream().listen((Position val) async {
      final mapVeiwState = ref.read(mapNaviProvider);
      final controller = ref.read(googleMapControllerProvider);
      final matrixCTL = ref.read(matrixControllerProvider.notifier);
      final naviState = ref.read(navigatingShellterProvider);

      state = state.copyWith(
        latitude: val.latitude,
        longitude: val.longitude,
      );
      if (mapVeiwState == MapNavi.navigation) {
        await controller!.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(
              state.latitude,
              state.longitude,
            ),
            18,
          ),
        );
        await matrixCTL.fechDistanceMatrix(
          PointLatLng(
            naviState!.geometry.coordinates[1],
            naviState.geometry.coordinates[0],
          ),
          PointLatLng(
            state.latitude,
            state.longitude,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/map_state.dart';
import '../provider/general_provider.dart';

class RealTimeLocationController extends StateNotifier<MapState> {
  final Ref ref;

  RealTimeLocationController(this.ref) : super(MapState()) {
    Geolocator.getPositionStream().listen((val) async {
      final mapVeiwState = ref.read(mapNaviProvider);
      final controller = ref.read(googleMapControllerProvider);
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
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

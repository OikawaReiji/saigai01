import 'dart:async';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/repository/map_repository.dart';
import '../model/map/map_state.dart';
import '../provider/general_provider.dart';

class MapController extends StateNotifier<AsyncValue<MapState>> {
  final Ref ref;
  GoogleMapController? controller;
  MapState? mapState;

  MapController(this.ref) : super(const AsyncLoading()) {
    Future(() async {
      final val = await ref.read(mapRepositoryProvider).determinePosition();
      await ref.read(markerControllerProvider.notifier).loadMarker();
      state = AsyncData(
        MapState(
          latitude: val.latitude,
          longitude: val.longitude,
        ),
      );
    });
  }

  Future<void> initNavigation(
    GoogleMapController mapController,
    LatLng target,
    Function() toDenger,
    Function() loadingFunction,
    Function() popFunction,
  ) async {
    // 現在地のフォーカス
    await mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        target,
        18,
      ),
    );
    await toDenger();
    //ロード画面
    loadingFunction();
    await Future.delayed(const Duration(milliseconds: 500));
    popFunction();
  }

  Future<void> setCamera(
    LatLng current,
    LatLng dest,
    GoogleMapController mapController,
  ) async {
    double south, north, west, east = 0;

    final polyline = ref.watch(polylineControllerProvider);

    final double latMax = polyline.map((e) => e.latitude).reduce(max);
    final double latMin = polyline.map((e) => e.latitude).reduce(min);
    final double lonMax = polyline.map((e) => e.longitude).reduce(max);
    final double lonMin = polyline.map((e) => e.longitude).reduce(min);

    north = current.latitude > dest.latitude
        ? current.latitude > latMax
            ? current.latitude
            : latMax
        : dest.latitude > latMax
            ? dest.latitude
            : latMax;

    south = current.latitude < dest.latitude
        ? current.latitude < latMin
            ? current.latitude
            : latMin
        : dest.latitude < latMin
            ? dest.latitude
            : latMin;
    east = current.longitude > dest.longitude
        ? current.longitude > lonMax
            ? current.longitude
            : lonMax
        : dest.longitude > lonMax
            ? dest.longitude
            : lonMax;
    west = current.longitude < dest.longitude
        ? current.longitude < lonMin
            ? current.longitude
            : lonMin
        : dest.longitude < lonMin
            ? dest.longitude
            : lonMin;
    await mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(south, west),
          northeast: LatLng(north, east),
        ),
        20,
      ),
    );
  }
}

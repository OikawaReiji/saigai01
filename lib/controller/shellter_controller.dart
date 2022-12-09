import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/repository/shellter_repository.dart';
import '../model/map/map_state.dart';
import '../model/shellter/features.dart';
import '../model/shellter/shellter.dart';
import '../provider/general_provider.dart';

class ShellterController extends StateNotifier<ShellterList> {
  final Ref ref;
  final MapState mapState;
  late BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;

  ShellterController(this.ref, this.mapState)
      : super(const ShellterList(features: [])) {
    loadIconImage();
    feachShellter();
  }

  Future<void> feachShellter() async {
    final model = await ref.read(shellterRepositoryProvider).loadJsonAsset();
    final markerCTL = ref.read(markerControllerProvider.notifier);

    state = model;
    List<Features> features = [];
    model.features.asMap().forEach((index, geo) {
      final distance = Geolocator.distanceBetween(
        geo.geometry.coordinates[1],
        geo.geometry.coordinates[0],
        mapState.latitude,
        mapState.longitude,
      );
      final distanceModel = Features(
        type: "",
        geometry: model.features[index].geometry.copyWith(distance: distance),
        properties: state.features[index].properties,
      );
      features.add(distanceModel);
    });

    features
        .sort(((a, b) => a.geometry.distance.compareTo(b.geometry.distance)));
    markerCTL.updateMarkerId(features[0].geometry.coordinates[0].toString());
    state = state.copyWith(
      features: features,
    );
  }

  Future<void> loadIconImage() async {
    myIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/image/map_icom.png',
    );
  }
}

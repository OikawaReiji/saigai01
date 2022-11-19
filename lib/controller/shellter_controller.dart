import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/model/map_state.dart';
import 'package:saigai01/model/shellter.dart';
import 'package:saigai01/repository/shellter_repository.dart';

import '../model/features.dart';

class ShellterController extends StateNotifier<ShellterList> {
  final Ref ref;
  final MapState mapState;
  ShellterController(this.ref, this.mapState)
      : super(const ShellterList(features: [])) {
    feachShellter();
  }

  Future<void> feachShellter() async {
    final model = await ref.read(shellterRepositoryProvider).loadJsonAsset();
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
    state = state.copyWith(
      features: features,
    );
  }
}

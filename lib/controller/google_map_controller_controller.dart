import 'dart:async';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleMapControllerController
    extends StateNotifier<GoogleMapController?> {
  final Ref ref;

  GoogleMapControllerController(this.ref) : super(null);

  Future<void> onMapCreated(GoogleMapController mapController) async {
    final googleMapStyle =
        await rootBundle.loadString('assets/jsons/google_map_style.json');
    await mapController.setMapStyle(googleMapStyle);
    state = mapController;
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapRepositoryProvider =
    Provider<MapRepository>((ref) => MapRepositoryImple(ref));

abstract class MapRepository {
  Future<Position> determinePosition();
}

class MapRepositoryImple implements MapRepository {
  MapRepositoryImple(this.reader);

  final Ref reader;

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if Location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
      if (permission != LocationPermission.denied) {
        return Future.error('Location permissions are disabled.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are disabled permanently.');
    }
    return await Geolocator.getCurrentPosition();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:saigai01/model/distancematrix/matrix_state.dart';

final mapRepositoryProvider =
    Provider<MapRepository>((ref) => MapRepositoryImple(ref));

abstract class MapRepository {
  Future<Position> determinePosition();
  Future<MatrixState?> fechDistanceMatrix(
    PointLatLng destinations,
    PointLatLng start,
  );
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

  @override
  Future<MatrixState?> fechDistanceMatrix(
    PointLatLng destinations,
    PointLatLng start,
  ) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=${destinations.latitude},${destinations.longitude}&origins=${start.latitude},${start.longitude}&mode=walking&key=AIzaSyBt5OVfrvXEdWE_pMMVsuIyl75-6EN4IHE';
      var response = await Dio().get(url);
      final model = MatrixState.fromJson(
          Map<String, dynamic>.from(response.data["rows"][0]["elements"][0]));

      return model;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

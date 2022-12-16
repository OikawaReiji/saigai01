import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final polylineRepository = Provider<FeachPolylineRepository>(
    (ref) => FeachPolylineRepositoryImple(ref));

abstract class FeachPolylineRepository {
  Future<List<PointLatLng>> getPolyline(
      PointLatLng origin, PointLatLng destination);
}

class FeachPolylineRepositoryImple implements FeachPolylineRepository {
  FeachPolylineRepositoryImple(this.reader);

  final Ref reader;
  PolylinePoints polylinePoints = PolylinePoints();

  @override
  Future<List<PointLatLng>> getPolyline(
      PointLatLng origin, PointLatLng destination) async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBt5OVfrvXEdWE_pMMVsuIyl75-6EN4IHE",
      origin,
      destination,
      avoidHighways: true,
      avoidTolls: true,
      travelMode: TravelMode.walking,
    );

    return result.points;
  }
}

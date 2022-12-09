import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:ui' as ui;

import '../model/map/marker_data.dart';

class MarkerController extends StateNotifier<MarkerData> {
  final Ref ref;

  MarkerController(this.ref) : super(MarkerData());

  Future<void> loadMarker() async {
    final Uint8List markerIconSelected =
        await getBytesFromAsset('assets/img/map_icon_selected.png', 200);
    final mapIconSelected = BitmapDescriptor.fromBytes(markerIconSelected);

    final Uint8List markerIcon =
        await getBytesFromAsset('assets/img/map_icon.png', 100);
    final mapIcon = BitmapDescriptor.fromBytes(markerIcon);

    state = MarkerData(
      mapIcon: mapIcon,
      mapIconSelected: mapIconSelected,
      mapIconUser: mapIcon,
      markerId: "",
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void updateMarkerId(String i) {
    state = state.copyWith(markerId: i);
  }
}

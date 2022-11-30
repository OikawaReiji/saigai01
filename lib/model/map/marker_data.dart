import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'marker_data.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class MarkerData with _$MarkerData {
  const MarkerData._();
  factory MarkerData({
    BitmapDescriptor? mapIcon,
    BitmapDescriptor? mapIconSelected,
    BitmapDescriptor? mapIconUser,
    String? markerId,
  }) = _MarkerData;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo.freezed.dart';
part 'geo.g.dart';

@freezed
abstract class Geo with _$Geo {
  const factory Geo({
    required String type,
    required List<double> coordinates,
    @Default(0) double distance,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'earthquake.freezed.dart';
part 'earthquake.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Earthquake with _$Earthquake {
  const Earthquake._();
  factory Earthquake({
    @JsonKey(name: 'Hypocenter') required String hypocenter,
    @JsonKey(name: 'MaxInt') required String maxInt,
    @JsonKey(name: 'OriginDateTime') required String originDateTime,
    @JsonKey(name: 'Magnitude') required String magnitude,
    @JsonKey(name: 'ReportDateTime') required String reportDateTime,
    @JsonKey(name: 'EventID') required String eventID,
  }) = _Earthquake;

  factory Earthquake.fromJson(Map<String, dynamic> json) =>
      _$EarthquakeFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'earthquake.dart';
part 'earthquake_list.freezed.dart';
part 'earthquake_list.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class EarthquakeList with _$EarthquakeList {
  const EarthquakeList._();
  factory EarthquakeList({
    @Default([]) List<Earthquake> objects,
    @JsonKey(name: 'next_cursor') required String nextCursor,
  }) = _EarthquakeList;

  factory EarthquakeList.fromJson(Map<String, dynamic> json) =>
      _$EarthquakeListFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo.dart';
import 'properties.dart';

part 'features.freezed.dart';
part 'features.g.dart';

@freezed
abstract class Features with _$Features {
  const factory Features({
    required String type,
    required Geo geometry,
    required Properties properties,
  }) = _Features;

  factory Features.fromJson(Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);
}

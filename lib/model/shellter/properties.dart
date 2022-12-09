import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties.freezed.dart';
part 'properties.g.dart';

@freezed
abstract class Properties with _$Properties {
  const factory Properties({
    @JsonKey(name: '指定緊急避難場所') required String name,
    @JsonKey(name: '所在地') required String location,
    @JsonKey(name: '洪水') required String flood,
    @JsonKey(name: 'がけ崩れ、土石流及び地滑り') required String landslide,
    @JsonKey(name: '高潮') required String surge,
    @JsonKey(name: '地震') required String earthquake,
    @JsonKey(name: '津波') required String tsunami,
    @JsonKey(name: '大規模な火事') required String fire,
    @JsonKey(name: '内水氾濫') required String inlandFlood,
    @JsonKey(name: '火山現象') required String volcano,
  }) = _Properties;

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}

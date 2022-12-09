import 'package:freezed_annotation/freezed_annotation.dart';
import 'features.dart';
part 'shellter.g.dart';
part 'shellter.freezed.dart';

@freezed
abstract class ShellterList with _$ShellterList {
  const factory ShellterList({
    required List<Features> features,
  }) = _ShellterList;

  factory ShellterList.fromJson(Map<String, dynamic> json) =>
      _$ShellterListFromJson(json);
}

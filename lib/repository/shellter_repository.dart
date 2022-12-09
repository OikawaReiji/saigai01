import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/shellter/shellter.dart';

final shellterRepositoryProvider =
    Provider<ShellterRepository>((ref) => ShellterRepositoryImple(ref));

abstract class ShellterRepository {
  Future<ShellterList> loadJsonAsset();
}

class ShellterRepositoryImple implements ShellterRepository {
  ShellterRepositoryImple(this.ref);
  final Ref ref;

  @override
  Future<ShellterList> loadJsonAsset() async {
    String loadData = await rootBundle.loadString('assets/jsons/iwate.geojson');
    final model =
        ShellterList.fromJson(jsonDecode(loadData) as Map<String, dynamic>);
    return model;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/earthquake/earthquake_list.dart';

final quakeRepositoryProvider =
    Provider<QuakeRepository>((ref) => QuakeRepositoryImple(ref));

abstract class QuakeRepository {
  Future<EarthquakeList> fechQuake();
}

class QuakeRepositoryImple implements QuakeRepository {
  final Ref ref;
  QuakeRepositoryImple(this.ref);

  @override
  Future<EarthquakeList> fechQuake() async {
    try {
      const url = 'https://quake.one/api/list.json?filter=maxint&value=3';
      var response = await Dio().get(url);
      final model =
          EarthquakeList.fromJson(Map<String, dynamic>.from(response.data));
      return model;
    } catch (e) {
      debugPrint(e.toString());
      return EarthquakeList(nextCursor: '');
    }
  }
}

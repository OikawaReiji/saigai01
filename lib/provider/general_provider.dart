import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/controller/auth_controller.dart';
import 'package:saigai01/controller/map_controller.dart';
import 'package:saigai01/controller/polyline_controller.dart';
import 'package:saigai01/controller/shellter_controller.dart';
import 'package:saigai01/model/features.dart';
import 'package:saigai01/model/map_state.dart';
import 'package:saigai01/model/shellter.dart';

import '../controller/google_map_controller_controller.dart';
import '../controller/real_time_location_controller.dart';
import '../controller/user_controller.dart';
import '../model/user_state.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref));

enum Pages {
  top,
  signUp,
  login,
}

final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);

enum Bar {
  map,
  publicOff,
  emojiPeople,
  settings,
}

final pageRootProvider = StateProvider<Bar>((ref) => Bar.map);

// enum Accounts {
//   account,
// }

// final accountRootProvider = StateProvider<Accounts>((ref) => Accounts.account);
final mapControllerProvider =
    StateNotifierProvider<MapController, AsyncValue<MapState>>(
        (ref) => MapController(ref));
final realTimeLocationCTLProvider =
    StateNotifierProvider<RealTimeLocationController, MapState>(
        (ref) => RealTimeLocationController(ref));
final googleMapControllerProvider =
    StateNotifierProvider<GoogleMapControllerController, GoogleMapController?>(
        (ref) => GoogleMapControllerController(ref));

final shellterControllerProvider =
    StateNotifierProvider.family<ShellterController, ShellterList, MapState>(
        (ref, state) => ShellterController(ref, state));

final detailsProvider = StateProvider.autoDispose<Features?>((ref) => null);

enum MapNavi {
  list,
  loading,
  route,
  navigation,
}

final mapNaviProvider = StateProvider<MapNavi>((ref) => MapNavi.list);

final polylineControllerProvider =
    StateNotifierProvider<PolylineController, PolylineResult>(
        (ref) => PolylineController(ref));

final navigatingShellterProvider = StateProvider<Features?>((ref) => null);

final userControllerProvider =
    StateNotifierProvider<UserController, UserState?>(
        (ref) => UserController(ref));

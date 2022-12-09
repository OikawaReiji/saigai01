import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/controller/auth_controller.dart';
import 'package:saigai01/controller/map_controller.dart';
import 'package:saigai01/controller/marker_controller.dart';
import 'package:saigai01/controller/matrix_controller.dart';
import 'package:saigai01/controller/polyline_controller.dart';
import 'package:saigai01/controller/shellter_controller.dart';
import 'package:saigai01/model/chat_state.dart';
import 'package:saigai01/model/distancematrix/matrix_state.dart';
import '../controller/chat_controller.dart';
import '../controller/friends_controller.dart';
import '../controller/google_map_controller_controller.dart';
import '../controller/real_time_location_controller.dart';

import '../controller/users_controller.dart';
import '../model/map/map_state.dart';
import '../model/map/marker_data.dart';
import '../model/shellter/features.dart';
import '../model/shellter/shellter.dart';
import '../model/users_state.dart';


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
    StateNotifierProvider<PolylineController, List<PointLatLng>>(
        (ref) => PolylineController(ref));

final navigatingShellterProvider = StateProvider<Features?>((ref) => null);


final friendsListControllerProvider =
    StateNotifierProvider<FriendsController, List<UsersState>>(
        (ref) => FriendsController(ref));

final usersControllerProvider =
    StateNotifierProvider<UsersController, UsersState?>(
        (ref) => UsersController(ref));

final chatControllerProvider =
    StateNotifierProvider.family<ChatController, List<ChatState>, String>(
        (ref, state) => ChatController(ref, state));
final markerControllerProvider =
    StateNotifierProvider<MarkerController, MarkerData?>(
        (ref) => MarkerController(ref));

final matrixControllerProvider =
    StateNotifierProvider<MatrixController, MatrixState>(
        (ref) => MatrixController(ref));


import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/controller/auth_controller.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref));

enum Pages {
  top,
  signUp,
  login,
  set,
}

final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);

enum Bar {
  map,
  publicOff,
  emojiPeople,
  settings,
}

final pageRootProvider = StateProvider<Bar>((ref) => Bar.map);

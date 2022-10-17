import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/controller/auth_controller.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref));
// Enum Pages{}
// final authSwitcherPriovider = StateProvider<Pages>((ref) => Pages.top);
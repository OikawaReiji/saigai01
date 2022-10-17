import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/auth_repository.dart';

class AuthController extends StateNotifier<User?> {
  final Ref ref;
  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this.ref) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = ref
        .read(authRepositoryProvider)
        .authStateChange
        .listen((user) => state = user);
  }
  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }
}

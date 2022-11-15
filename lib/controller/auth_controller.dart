import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<void> signUp(
    String email,
    String password,
    String name,
    String phone,
    ValueNotifier<bool> loading,
  ) async {
    try {
      final flg =
          await ref.read(authRepositoryProvider).signUp(email, password);
      if (flg == null) {
        await ref.read(authRepositoryProvider).saveUserData(name, phone);
      }
      loading.value = false;
    } catch (e) {
      throw e.toString();
    }
  }

  void showToast(String flg) {}

  Future<void> signin(
    String email,
    String password,
    ValueNotifier<bool> loading,
  ) async {
    try {
      final flg = await ref
          .read(authRepositoryProvider)
          .signInWithEmail(email, password);

      loading.value = false;
    } catch (e) {
      loading.value = false;
      throw e.toString();
    }
  }

  Future<void> signout() async {
    try {
      final flg = await ref.read(authRepositoryProvider).signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

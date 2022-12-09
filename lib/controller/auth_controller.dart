import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    debugPrint("君成田");
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
      if (email == "" || password == "" || name == "" || phone == "") {
        loading.value = false;
        return showToast("no-data");
      }
      final flg =
          await ref.read(authRepositoryProvider).signUp(email, password);
      if (flg == null) {
        await ref.read(authRepositoryProvider).saveUserData(name, phone);
      } else {
        showToast(flg);
      }
      loading.value = false;
    } catch (e) {
      throw e.toString();
    }
  }


  void showToast(String flg) {
    String msg = "";
    switch (flg) {
      case "email-already-in-use":
        msg = "そのメールアドレスは既に使われています。";
        break;
      case "invalid-email":
        msg = "そのメールアドレスは無効です";
        break;
      case "operation-not-allowed":
        msg = "有効なユーザーではありません。";
        break;
      case "weak-password":
        msg = "パスワードが短すぎます。";
        break;
      case "no-data":
        msg = "すべて必須項目です。";
        break;
      case "wrong-password":
        msg = "間違ったパスワードです。";
        break;
      case "user-disabled":
        msg = "メールアドレスが無効です。";
        break;
      case "user-not-found":
        msg = "そのメールアドレスは登録されていません。";
        break;
      default:
        msg = "";
        return;
    }
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0);
  }


  Future<void> signin(
    String email,
    String password,
    ValueNotifier<bool> loading,
  ) async {
    try {

      if (email == "" || password == "") {
        loading.value = false;
        return showToast("no-data");
      }
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
      await ref.read(authRepositoryProvider).signOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

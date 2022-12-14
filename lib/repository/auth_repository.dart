import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/firebase_auth_provider.dart';
import 'package:saigai01/provider/firebase_firestore_provider.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepositoryImple(ref));

abstract class AuthRepository {
  Future<String?> signInWithEmail(String email, String password);
  Future<String?> signUp(String email, String password);
  Future<void> saveUserData(String name, String phone);
  Future signOut();
  Stream<User?> get authStateChange;
}

class AuthRepositoryImple implements AuthRepository {
  final Ref ref;
  CollectionReference? storeCollectionReference;
  final messaging = FirebaseMessaging.instance;

  AuthRepositoryImple(this.ref) {
    storeCollectionReference =
        ref.read(firebaseFirestoreProvider).collection("user");
  }

  @override
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          );
      return null;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  @override
  Future<String?> signUp(String email, String password) async {
    try {
      await ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return null;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  @override
  Future<void> saveUserData(String name, String phone) async {
    User? user = ref.read(firebaseAuthProvider).currentUser;

    try {
      final token = await messaging.getToken();

      await storeCollectionReference?.doc(user?.uid).set({
        'uid': user?.uid,
        'email': user?.email,
        'name': name,
        'phone': phone,
        'friends': [],
        'status': "safety",
        'token': token,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future signOut() async {
    try {
      await ref.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  @override
  Stream<User?> get authStateChange =>
      ref.read(firebaseAuthProvider).authStateChanges();
}

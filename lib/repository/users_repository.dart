import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/firebase_firestore_provider.dart';
import 'package:saigai01/provider/general_provider.dart';
import '../model/users_state.dart';

final usersRepositoryProvider =
    Provider<UsersRepository>((ref) => GenreRepositoryImple(ref));

abstract class UsersRepository {
  Stream<UsersState?> feachUserData();
}

class GenreRepositoryImple implements UsersRepository {
  CollectionReference? collectionReference;
  final Ref ref;
  String? userId;
  GenreRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFirestoreProvider).collection("user");
    userId = ref.read(authControllerProvider)!.uid;
  }

  @override
  Stream<UsersState?> feachUserData() async* {
    final stateRef = collectionReference!.doc(userId).withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    yield* stateRef.snapshots().map((snap) => snap.data());
  }
}

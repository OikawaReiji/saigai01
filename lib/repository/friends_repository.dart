import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/firebase_firestore_provider.dart';
import 'package:saigai01/provider/general_provider.dart';
import '../model/users_state.dart';

final friendsListRepositoryProvider =
    Provider<FriendsListRepository>((ref) => FriendsListRepositoryImple(ref));

abstract class FriendsListRepository {
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends();
  Future<UsersState?> searchUser(String uid);
  Future<void> makeFriend(String uid, List friendList, List myList);
}

class FriendsListRepositoryImple implements FriendsListRepository {
  final Ref ref;
  CollectionReference? collectionReference;
  String? userId;

  FriendsListRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFirestoreProvider).collection("user");
    userId = ref.read(authControllerProvider)!.uid;
  }

  @override
  Stream<List<QueryDocumentSnapshot<UsersState>>> feachFriends() async* {
    final uid = ref.watch(authControllerProvider)!.uid;
    debugPrint(uid);

    final stateRef = collectionReference!
        .where('friends', arrayContains: uid)
        .withConverter<UsersState>(
          fromFirestore: (snapshot, _) => UsersState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Future<UsersState?> searchUser(String uid) async {
    try {
      if (uid.contains("//")) {
        return null;
      }
      final docSnapshot =
          collectionReference!.doc(uid).withConverter<UsersState>(
                fromFirestore: (snapshot, _) =>
                    UsersState.fromJson(snapshot.data()!),
                toFirestore: (data, _) => data.toJson(),
              );
      final docSnap = await docSnapshot.get();
      final result = docSnap.data();
      return result;
    } on FirebaseAuthException {
      return null;
    }
  }

  @override
  Future<void> makeFriend(String uid, List friendList, List myList) async {
    await collectionReference!.doc(uid).update({
      'friends': friendList,
    });
    await collectionReference!.doc(userId).update({
      'friends': myList,
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/user_state.dart';
import '../provider/firebase_firestore_provider.dart';
import '../provider/general_provider.dart';

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepositoryImple(ref));

abstract class UserRepository {
  Stream<UserState?> feachGenreList();
}

class UserRepositoryImple implements UserRepository {
  final Ref ref;
  String? userId;
  CollectionReference? collectionReference;
  UserRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFirestoreProvider).collection("user");
    userId = ref.read(authControllerProvider)!.uid;
  }

  @override
  Stream<UserState?> feachGenreList() async* {
    final stateRef = collectionReference!.doc(userId).withConverter<UserState>(
          fromFirestore: (snapshot, _) => UserState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    yield* stateRef.snapshots().map((snap) => snap.data());
  }
}

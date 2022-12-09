import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/firebase_firestore_provider.dart';
import 'package:saigai01/provider/general_provider.dart';
import '../controller/users_controller.dart';
import '../model/users_state.dart';
import '../provider/firebase_storage_provider.dart';

final usersRepositoryProvider =
    Provider<UsersRepository>((ref) => GenreRepositoryImple(ref));

abstract class UsersRepository {
  Stream<UsersState?> feachUserData();
  Future<String> uploadImage(File image);
  Future<void> saveImageUrl(String url, ImageSelect select);
  Future<void> updateText(String text, TextSelect select);
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

  @override
  Future<String> uploadImage(File image) async {
    final date = DateTime.now().toString();

    String uploadName = "$date.png";
    final storageRef = ref
        .read(firebaseStorageProvider)
        .ref()
        .child('usersImage/$userId/$uploadName');

    await storageRef.putFile(image);
    return await storageRef.getDownloadURL();
  }

  @override
  Future<void> saveImageUrl(String url, ImageSelect select) async {
    if (select == ImageSelect.circle) {
      await collectionReference!.doc(userId).update({
        'profileImage': url,
      });
    } else {
      await collectionReference!.doc(userId).update({
        'headerImage': url,
      });
    }
  }

  @override
  Future<void> updateText(String text, TextSelect select) async {
    if (select == TextSelect.name) {
      await collectionReference!.doc(userId).update({
        'name': text,
      });
    } else if (select == TextSelect.address) {
      await collectionReference!.doc(userId).update({
        'address': text,
      });
    } else if (select == TextSelect.phone) {
      await collectionReference!.doc(userId).update({
        'phone': text,
      });
    } else if (select == TextSelect.safe) {
      await collectionReference!.doc(userId).update({
        'status': text,
      });
    }
  }
}

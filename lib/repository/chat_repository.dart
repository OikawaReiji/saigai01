import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/model/chat_state.dart';
import 'package:saigai01/provider/firebase_firestore_provider.dart';
import '../provider/firebase_storage_provider.dart';
import '../provider/general_provider.dart';

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepositoryImple(ref));

abstract class ChatRepository {
  Stream<List<QueryDocumentSnapshot<ChatState>>> feachChat(String uid);
  Future<void> sendChat(
    String text,
    String receiver,
    bool imageFlg,
    String imageUrl,
    DateTime time,
  );
  Future<String?> saveImage(File image);
}

class ChatRepositoryImple implements ChatRepository {
  CollectionReference? collectionReference;

  final Ref ref;

  ChatRepositoryImple(this.ref) {
    collectionReference =
        ref.read(firebaseFirestoreProvider).collection("chat");
  }

  @override
  Stream<List<QueryDocumentSnapshot<ChatState>>> feachChat(String uid) async* {
    final myUid = ref.read(usersControllerProvider)!.uid;
    final stateRef = collectionReference!
        .where(
          'receiver',
          whereIn: [uid, myUid],
        )
        .orderBy("registeTime", descending: false)
        .withConverter<ChatState>(
          fromFirestore: (snapshot, _) => ChatState.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

    yield* stateRef.snapshots().map((doc) => doc.docs);
  }

  @override
  Future<void> sendChat(
    String text,
    String receiver,
    bool imageFlg,
    String imageUrl,
    DateTime time,
  ) async {
    try {
      final uid = ref.read(usersControllerProvider)!.uid;
      final chat = ChatState(
        text: text,
        sender: uid,
        receiver: receiver,
        imageFlg: imageFlg,
        imageUrl: imageUrl,
        registeTime: time,
      );
      await collectionReference?.add(chat.toJson());
    } on FirebaseAuthException {
      debugPrint("チャット送信　エラー");
    }
  }

  @override
  Future<String?> saveImage(File image) async {
    final date = DateTime.now().toString();

    String uploadName = "$date.png";
    final storageRef =
        ref.read(firebaseStorageProvider).ref().child('chatImage/$uploadName');

    await storageRef.putFile(image);
    return await storageRef.getDownloadURL();
  }
}

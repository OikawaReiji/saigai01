import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saigai01/model/chat_state.dart';
import 'package:saigai01/repository/chat_repository.dart';

import '../provider/general_provider.dart';

class ChatController extends StateNotifier<List<ChatState>> {
  final Ref ref;
  final picker = ImagePicker();

  ChatController(this.ref, String uid) : super([]) {
    final myUid = ref.read(usersControllerProvider)!.uid;

    ref.read(chatRepositoryProvider).feachChat(uid).listen((data) {
      state = data
          .map((doc) => doc.data())
          .toList()
          .where((e) => e.sender == uid || e.sender == myUid)
          .toList();
    });
  }

  Future<void> sendChat(
    String text,
    String receiver,
    bool imageFlg,
    String imageUrl,
  ) async {
    await ref.read(chatRepositoryProvider).sendChat(
          text,
          receiver,
          imageFlg,
          imageUrl,
          DateTime.now(),
        );
  }

  Future<void> sendChatImage(String receiver, ImageSource source) async {
    final pickedFile = await picker.pickImage(
      imageQuality: 80,
      source: source,
    );

    if (pickedFile == null) {
      return;
    }
    File file = File(pickedFile.path);

    final url = await ref.read(chatRepositoryProvider).saveImage(file);

    if (url == null) {
      return;
    }
    await ref.read(chatRepositoryProvider).sendChat(
          "",
          receiver,
          true,
          url,
          DateTime.now(),
        );
  }
}

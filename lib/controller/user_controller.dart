import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_state.dart';
import '../repository/user_repository.dart';
import 'dart:io';
import 'dart:async';

class UserController extends StateNotifier<UserState?> {
  final Ref ref;

  UserController(this.ref) : super(null) {
    ref.read(userRepositoryProvider).feachGenreList().listen((data) {
      state = data;
    });
  }
  Future<void> getimage() async {
    final ImagePicker _picker = ImagePicker();
    await _picker.pickImage(source: ImageSource.gallery);
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}

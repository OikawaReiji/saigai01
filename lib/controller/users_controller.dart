import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saigai01/repository/users_repository.dart';
import '../model/users_state.dart';

enum ImageSelect {
  circle,
  header,
}

enum TextSelect {
  name,
  address,
  phone,
  safe,
}

class UsersController extends StateNotifier<UsersState?> {
  final Ref ref;

  UsersController(this.ref) : super(UsersState()) {
    ref
        .read(usersRepositoryProvider)
        .feachUserData()
        .listen((data) => state = data!);
  }

  final picker = ImagePicker();
  Future<void> getImage(ImageSource source, CropAspectRatio ratio,
      CropStyle? cropStyle, ImageSelect select) async {
    final pickedFile = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );
    if (pickedFile == null) {
      return;
    }
    final croppedFile = await cropImage(pickedFile.path, ratio, cropStyle);
    if (croppedFile == null) {
      return;
    }

    final url =
        await ref.read(usersRepositoryProvider).uploadImage(croppedFile);
    await ref.read(usersRepositoryProvider).saveImageUrl(url, select);
  }

  Future<File?> cropImage(
      String path, CropAspectRatio ratio, CropStyle? cropStyle) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      cropStyle: cropStyle ?? CropStyle.rectangle,
      aspectRatio: ratio,
      compressQuality: 80,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '画像の位置選択',
          toolbarColor: const Color.fromARGB(255, 255, 0, 0),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          hideBottomControls: true,
          showCropGrid: false,
        ),
      ],
    );
    if (croppedFile == null) return null;

    return File(croppedFile.path);
  }

  Future<void> updateText(
      String text, TextSelect select, Function() function) async {
    await ref.read(usersRepositoryProvider).updateText(text, select);
    function();
  }
}

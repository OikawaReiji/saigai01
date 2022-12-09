import 'package:flutter/material.dart';

import '../../constant/hex_color.dart';

class PictureDialog extends StatelessWidget {
  const PictureDialog({
    super.key,
    required this.galleryFunction,
    required this.cameraFunction,
  });
  final Function() galleryFunction;
  final Function() cameraFunction;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: HexColor("#615C5C"),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () async {
            cameraFunction();
            Navigator.pop(context);
          },
          child: const Text(
            "写真を撮る",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        SimpleDialogOption(
          onPressed: () async {
            galleryFunction();
            Navigator.pop(context);
          },
          child: const Text(
            "フォルダから画像を選択",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

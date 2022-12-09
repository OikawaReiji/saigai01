import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class LogOutDialog extends HookConsumerWidget {
  const LogOutDialog({
    super.key,
    required this.subText,
    required this.title,
  });
  final String subText;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider.notifier);

    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: HexColor("#615C5C"),
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontSize: 23,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            subText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await authController.signout();
            Navigator.pop(context);
          },
          child: const Center(
            child: Text("ログアウト"),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text("キャンセル"),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/controller/users_controller.dart';
import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class EditTextDialog extends HookConsumerWidget {
  const EditTextDialog({
    super.key,
    required this.hintText,
    required this.title,
    required this.select,
  });
  final String hintText;
  final String title;
  final TextSelect select;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: "");
    final userCTL = ref.watch(usersControllerProvider.notifier);

    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: HexColor("#615C5C"),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.only(bottom: 30, top: 15),
          decoration: BoxDecoration(
            color: HexColor("#2e3037"),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 23, color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SimpleDialogOption(
          onPressed: () async {
            if (controller.text == "") return;
            await userCTL.updateText(
              controller.text,
              select,
              () => Navigator.pop(context),
            );
          },
          padding: EdgeInsets.zero,
          child: const Text(
            "送信",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}

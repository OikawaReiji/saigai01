import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';

class Notice extends HookConsumerWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: HexColor("#615C5C"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 62, 60, 60),
        centerTitle: true,
        title: Text(
          "通知",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text(
              '戻る',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),

          ),
        ),
      ),
    );
  }
}

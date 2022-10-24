import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/auth/my_textfield.dart';

import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class Set extends HookConsumerWidget {
  const Set({super.key});
  static String id = "Set";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController =
        ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行

    return Scaffold(
      backgroundColor: HexColor("#3F3F3F"),
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 106, 190, 255),
                    ),
                  ),
                ],
              ),
              // child: Column(
              //   children: [
              //     //アイコンの設定
              //     Container(
              //       //アイコンの縦幅・横幅
              //       height: 100,
              //       width: 100,
              //       margin: const EdgeInsets.only(top: 200),
              //       decoration: const BoxDecoration(
              //         color: Colors.red,
              //         shape: BoxShape.circle,
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

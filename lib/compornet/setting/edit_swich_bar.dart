import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/hex_color.dart';
import '../../provider/general_provider.dart';

class EditSwichBar extends HookConsumerWidget {
  const EditSwichBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final userCTL = ref.watch(usersControllerProvider.notifier);

    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: HexColor("#2e3037"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "notification",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 188, 188, 188),
                      ),
                    ),
                    Text(
                      userState!.notificationFlg ? "通知設定 ON" : "通知設定 OFF",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Switch(
                value: userState.notificationFlg,
                onChanged: (val) async {
                  await userCTL.updateFlg(val);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

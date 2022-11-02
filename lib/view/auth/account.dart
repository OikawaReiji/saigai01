import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../compornet/auth/my_bar.dart';
import '../../../provider/general_provider.dart';

class Account extends HookConsumerWidget {
  const Account({super.key});

  static String id = "Account";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController = ref.watch(authSwitcherPriovider.notifier);
    return SizedBox(
      child: Column(
        children: [
          Container(
            alignment: Alignment(-0.8, 0.8),
            child: Text("アカウント設定", style: TextStyle(color: Colors.white)),
          ),
          MyBar(
            text: 'プロフィールの編集',
            icon: Icons.directions_walk_outlined,
            icon2: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}

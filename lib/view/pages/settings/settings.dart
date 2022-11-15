import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/auth/my_bar.dart';
import 'package:saigai01/compornet/auth/my_textfield.dart';
import 'package:saigai01/view/auth/Top.dart';
import 'package:saigai01/view/pages/settings/account.dart';
import 'package:saigai01/view/pages/settings/notice.dart';
import 'package:saigai01/view/pages/settings/profile.dart';

import '../../../constant/hex_color.dart';
import '../../../provider/general_provider.dart';

class settingspage extends HookConsumerWidget {
  const settingspage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController =
        ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行
    final authController = ref.watch(authControllerProvider.notifier);

    return SafeArea(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 130,
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    child: Stack(
                      children: [
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.prod.hjholdings.tv/d3urerHm/uploads/e38a15bc-26ab-41cb-98c5-a9f0edd65aab.png?w=1600&h=600&p=t"),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.8, 0.8),
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://pbs.twimg.com/profile_images/1476930792404426755/TKHWR94S_400x400.jpg"),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              alignment: Alignment(-0.5, 0.8),
              child: Text(
                '仮ノ名前',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment(-0.8, 0.8),
              child: Text("アカウント設定", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profile(),
                  ),
                );
              },
              child: MyBar(
                text: 'プロフィールの編集',
                icon: Icons.directions_walk_outlined,
                icon2: Icons.arrow_forward_ios,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => accountpage(),
                      ),
                    );
                  },
                  child: MyBar(
                    text: 'アカウントの編集',
                    icon: Icons.person_outline,
                    icon2: Icons.arrow_forward_ios,
                  ),
                ),
                Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => notice(),
                        ),
                      );
                    },
                    child: MyBar(
                      text: '通知の設定',
                      icon: Icons.notification_add,
                      icon2: Icons.arrow_forward_ios,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        GestureDetector(
                          child: Text('ログアウト',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 25)),
                          onTap: () async {
                            await authController.signout();
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

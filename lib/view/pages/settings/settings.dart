import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/auth/my_bar.dart';
import 'package:saigai01/view/pages/settings/account.dart';
import 'package:saigai01/view/pages/settings/notice.dart';
import 'package:saigai01/view/pages/settings/profile.dart';
import '../../../provider/general_provider.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider.notifier);

    return SafeArea(
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: Stack(
                children: [
                  SizedBox(
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
                          alignment: const Alignment(-0.8, 0.8),
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
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
              alignment: const Alignment(-0.5, 0.8),
              child: const Text(
                '仮ノ名前',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: const Alignment(-0.8, 0.8),
              child:
                  const Text("アカウント設定", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const profile(),
                  ),
                );
              },
              child: const MyBar(
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
                        builder: (context) => const AccountPage(),
                      ),
                    );
                  },
                  child: const MyBar(
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
                          builder: (context) => const Notice(),
                        ),
                      );
                    },
                    child: const MyBar(
                      text: '通知の設定',
                      icon: Icons.notification_add,
                      icon2: Icons.arrow_forward_ios,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                        ),
                        GestureDetector(
                          child: const Text('ログアウト',
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

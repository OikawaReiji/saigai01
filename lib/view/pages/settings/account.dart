import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/view/pages/settings/adrr_edit.dart';
import 'package:saigai01/view/pages/settings/mail_edit.dart';
import 'package:saigai01/view/pages/settings/phone_edit.dart';
import '../../../compornet/auth/account_bar.dart';
import '../../../constant/hex_color.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});
  static String id = "Account";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: HexColor("#615C5C"),
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 62, 60, 60),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Row(
                        children: const [
                          Text("戻る",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    const Text("アカウント",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: const Alignment(-0.8, 0.8),
                    child: const Text("アカウント情報",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MailEdit(),
                        ),
                      );
                    },
                    child: const AccountBar(
                      text: 'メールアドレス',
                      text2: 'NNNNNN@NNNNNN',
                      icon: Icons.arrow_forward_ios,
                      stream: null,
                    ),
                  ),
                  const SizedBox(height: 1),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const phone_edit(),
                        ),
                      );
                    },
                    child: const AccountBar(
                      text: '電話番号　　　',
                      text2: '+ xxx-xxx-xxxx',
                      icon: Icons.arrow_forward_ios,
                      stream: null,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const addr_edit(),
                        ),
                      );
                    },
                    child: const AccountBar(
                      text: '現在の住所　　',
                      text2: 'NN県NN市NN町N-N',
                      icon: Icons.arrow_forward_ios,
                      stream: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

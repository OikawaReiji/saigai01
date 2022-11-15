import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/view/pages/settings/adrr_edit.dart';
import 'package:saigai01/view/pages/settings/mail_edit.dart';
import 'package:saigai01/view/pages/settings/phone_edit.dart';

import '../../../compornet/auth/account_bar.dart';
import '../../../compornet/auth/my_bar.dart';
import '../../../constant/hex_color.dart';
import '../../../provider/general_provider.dart';

class accountpage extends HookConsumerWidget {
  const accountpage({super.key});
  static String id = "Account";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController = ref.watch(authSwitcherPriovider.notifier);
    var _text = 'Hello';
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
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 62, 60, 60),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Row(
                        children: [
                          Text("戻る",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Text("アカウント",
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
                    alignment: Alignment(-0.8, 0.8),
                    child: Text("アカウント情報",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mail_edit(),
                        ),
                      );
                    },
                    child: AccountBar(
                      text: 'メールアドレス',
                      text2: 'NNNNNN@NNNNNN',
                      icon: Icons.arrow_forward_ios,
                      stream: null,
                    ),
                  ),
                  SizedBox(height: 1),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => phone_edit(),
                        ),
                      );
                    },
                    child: AccountBar(
                      text: '電話番号　　　',
                      text2: '+ xxx-xxx-xxxx',
                      icon: Icons.arrow_forward_ios,
                      stream: null,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addr_edit(),
                        ),
                      );
                    },
                    child: AccountBar(
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

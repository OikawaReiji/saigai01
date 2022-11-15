import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/edit_bar.dart';
import 'package:saigai01/constant/hex_color.dart';
import 'package:saigai01/view/pages/settings/account.dart';
import 'package:saigai01/view/pages/settings/notice.dart';

import '../../../provider/general_provider.dart';

class mail_edit extends HookConsumerWidget {
  const mail_edit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController =
        ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行

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
                      width: 25,
                    ),
                    Text("メールアドレスの変更",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '新しいメールアドレスを入力して下さい',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: edit_bar(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 62, 60, 60),
                ),
                child: Row(
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
                      child: Text(
                        '　変更',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

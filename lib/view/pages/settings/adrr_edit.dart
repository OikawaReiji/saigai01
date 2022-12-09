import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/edit_bar.dart';
import 'package:saigai01/constant/hex_color.dart';
import 'package:saigai01/view/pages/settings/account.dart';
import 'package:saigai01/view/pages/settings/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../provider/general_provider.dart';

class addr_edit extends HookConsumerWidget {
  const addr_edit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController = ref.watch(authSwitcherPriovider.notifier);
    final userState = ref.watch(userControllerProvider); //変更　関数の実行
    final _editController = TextEditingController();
    String _addr = "";
    String _docid = userState?.uid ?? "ななし";

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
                    Text("現在住所の変更",
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
                '新しい住所を入力して下さい',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 62, 60, 60),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Center(
                  child: TextFormField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _addr = value;
                    },
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
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
                        FirebaseFirestore.instance
                            .collection('user')
                            .doc(_docid)
                            .update({'addr': _addr});

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

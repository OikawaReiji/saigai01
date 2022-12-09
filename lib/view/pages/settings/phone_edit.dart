import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/edit_bar.dart';
import 'package:saigai01/constant/hex_color.dart';
import 'package:saigai01/view/pages/settings/account.dart';
import 'package:saigai01/view/pages/settings/notice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../provider/general_provider.dart';

class phone_edit extends HookConsumerWidget {
  const phone_edit({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageState = ref.watch(authSwitcherPriovider); //参照
    final authPageStateController =
        ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行
    final userState = ref.watch(userControllerProvider);
    final _editController = TextEditingController();
    var _userController = TextEditingController(text: "");
    String _phone = "";
    String _docid = userState?.uid ?? "ななし";
    String hobbyText = "";

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
                    Text("電話番号の変更",
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
                '新しい電話番号を入力して下さい',
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
                    controller: _editController,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _phone = value;
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
                        final hobbyText = _editController;
                        print(hobbyText);

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("hobbyText"),
                              );
                            });
                        // FirebaseFirestore.instance
                        //     .collection('user')
                        //     .doc(_docid)
                        //     .update({'phone': hobbyText});

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => accountpage(),
                        //   ),
                        // );
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

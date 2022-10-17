import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class Sign extends HookConsumerWidget {
  const Sign({super.key});
  static String id = "Sign";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController =
        ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 63, 63),
      appBar: AppBar(
        title: const Text(
          "新規登録",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            authPageStateController.state = Pages.top;
          },
          child: const Icon(Icons.arrow_back_outlined),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 63, 63),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                    child: Center(
                      child: TextFormField(
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              size: 40,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            hintText: "email",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                    child: Center(
                      child: TextFormField(
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              size: 40,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            hintText: "password",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                    child: Center(
                      child: TextFormField(
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.badge_outlined,
                              size: 40,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            hintText: "name",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                    child: Center(
                      child: TextFormField(
                        style: const TextStyle(fontSize: 25),
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.phone_in_talk_outlined,
                              size: 40,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            hintText: "phone",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint("破壊");
                    },
                    child: Container(
                      width: double.infinity,
                      height: 65,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 13, 245, 227),
                              width: 4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: const Center(
                        child: Text(
                          "登録",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Color.fromARGB(255, 13, 245, 227)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

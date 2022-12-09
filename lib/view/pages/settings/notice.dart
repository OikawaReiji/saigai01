import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';

import '../../../provider/general_provider.dart';

class notice extends HookConsumerWidget {
  const notice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var quake = false;
  var friend = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    final size = MediaQuery.of(context).size;
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
                      width: 85,
                    ),
                    Text("通知",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 75,
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
                    Text("地震速報",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox(
                      width: 140,
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: CupertinoSwitch(
                        value: quake,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(
                              () {
                                quake = value;
                                print("$quake");
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 75,
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
                    Text("フレンド通知",
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox(
                      width: 90,
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: CupertinoSwitch(
                        value: friend,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(
                              () {
                                friend = value;
                                print("$friend");
                              },
                            );
                          }
                        },
                      ),
                    )
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

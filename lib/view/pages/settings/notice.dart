import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';

class Notice extends HookConsumerWidget {
  const Notice({super.key});

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
                      width: 85,
                    ),
                    const Text("通知",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        )),
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

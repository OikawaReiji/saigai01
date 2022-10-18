import 'package:flutter/material.dart';
import 'package:saigai01/constant/hex_color.dart';

class First extends StatelessWidget {
  const First({super.key});
  static String id = "first";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#3F3F3F"),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  debugPrint("あああああ");
                },
                child: Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor("#3F3F3F"),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: HexColor("#0DF5E3"),
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "ログイン",
                      style: TextStyle(
                        color: HexColor("#0DF5E3"),
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 58,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: HexColor("#0DF5E3"),
                ),
                child: const Center(
                  child: Text(
                    "アカウントを作成",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

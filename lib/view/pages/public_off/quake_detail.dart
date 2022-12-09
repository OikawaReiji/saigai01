import 'package:flutter/material.dart';

import '../../../constant/hex_color.dart';
import 'quake.dart';

class quake_detail extends StatelessWidget {
  const quake_detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("3F3F3F"),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        )),
                    SizedBox(
                      width: 45,
                      height: 65,
                    ),
                    Text(
                      "地震最新情報",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

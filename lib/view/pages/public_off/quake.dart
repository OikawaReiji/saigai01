import 'package:flutter/material.dart';
import 'package:saigai01/view/pages/public_off/quake_detail.dart';

import '../../../constant/hex_color.dart';

class public_offpage extends StatelessWidget {
  const public_offpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Text(
              "地震最新情報",
              //文字のStyle変更
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: HexColor('#000000'),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    "X.X",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Column(
                    children: [
                      Text(
                        "場所",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "時刻",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "m",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => quake_detail(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:saigai01/constant/hex_color.dart';

class Top extends StatelessWidget {
  const Top({super.key});
  static String id = "Top";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#3F3F3F"),
      body: SizedBox(
        //横幅を最大まで伸ばす
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //アイコンの設定
              Container(
                //アイコンの縦幅・横幅
                height: 100,
                width: 100,
                margin: EdgeInsets.only(top: 200),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              Spacer(),
              //Image.asset("img/10.png")
              //ログインの遷移
              InkWell(
                onTap: () {
                  //ログインを押されたら実行
                  debugPrint("ログインしました");
                },
                child: Container(
                  height: 50,
                  //横幅を画面最大に伸ばす
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "ログイン",
                      //文字のStyle変更
                      style: TextStyle(
                        color: HexColor("#0DF5E3"),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: HexColor("#3F3F3F"),
                    //角を丸める(BorderRadius.circular)
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: HexColor("#0DF5E3"), width: 4),
                  ),
                ),
              ),

              //アカウント作成の遷移
              InkWell(
                onTap: () {
                  //アカウント作成を押されたら実行
                  debugPrint("アカウント作成しました");
                },
                child: Container(
                  height: 50,
                  //ログインとアカウント作成の間を開ける
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    "アカウント作成",
                    style: TextStyle(fontSize: 25),
                  )),
                  decoration: BoxDecoration(
                    color: HexColor("#0DF5E3"),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

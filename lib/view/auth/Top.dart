import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';
import '../../gen/assets.gen.dart';
import '../../provider/general_provider.dart';

class Top extends HookConsumerWidget {
  const Top({super.key});
  static String id = "Top";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authPageStateController = ref.watch(authSwitcherPriovider.notifier);

    return Scaffold(
      backgroundColor: HexColor("#3F3F3F"),
      body: SafeArea(
        child: SizedBox(
          //横幅を最大まで伸ばす
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.only(top: 110),
                  clipBehavior: Clip.hardEdge,
                  child: Assets.img.toppageIcon.image(
                    //アイコンのstyle
                    width: 150,
                    height: 150,
                  ),
                ),
                const Spacer(),

                //Image.asset("img/10.png")
                //ログインの遷移
                InkWell(
                  onTap: () {
                    //ログインを押されたら実行
                    debugPrint("ログインしました");
                    authPageStateController.state = Pages.login;
                  },
                  child: Container(
                    height: 50,
                    //横幅を画面最大に伸ばす
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor("#3F3F3F"),
                      //角を丸める(BorderRadius.circular)
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: HexColor("#0DF5E3"), width: 4),
                    ),
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
                  ),
                ),

                //アカウント作成の遷移
                InkWell(
                  onTap: () {
                    //アカウント作成を押されたら実行
                    debugPrint("アカウント作成しました");
                    authPageStateController.state = Pages.signUp;
                  },
                  child: Container(
                    height: 50,
                    //ログインとアカウント作成の間を開ける
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: HexColor("#0DF5E3"),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Center(
                        child: Text(
                      "アカウント作成",
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

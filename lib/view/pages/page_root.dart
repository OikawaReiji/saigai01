import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';
import 'package:saigai01/provider/general_provider.dart';
import 'package:saigai01/view/pages/emoji_people/emoji_people.dart';
import 'package:saigai01/view/pages/map/map.dart';
import 'package:saigai01/view/pages/public_off/quake.dart';
import 'package:saigai01/view/pages/settings/settings.dart';

class PageRoot extends HookConsumerWidget {
  const PageRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageRootState = ref.watch(pageRootProvider); //値の参照（参照のみ）
    final pageRootController = ref.watch(pageRootProvider.notifier); //値の変更

    final List<Widget> bar = [
      mappage(),
      public_offpage(),
      emoji_peoplepage(),
      settingspage(),
    ];

    return Scaffold(
      backgroundColor: HexColor("#3f3f3f"),
      body: bar[pageRootState.index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          pageRootController.state = Bar.values[index];
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map), //マップのアイコン
            label: "",
            backgroundColor: HexColor("#3E3C3C"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public_off), //災害情報のアイコン
            label: "",
            backgroundColor: HexColor("#3E3C3C"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people), //フレンド一覧のアイコン
            label: "",
            backgroundColor: HexColor("#3E3C3C"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), //設定画面のアイコン
            label: "",
            backgroundColor: HexColor("#3E3C3C"),
          )
        ],
        currentIndex: pageRootState.index,
      ),
    );
  }
}

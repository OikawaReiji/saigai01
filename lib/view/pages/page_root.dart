import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/general_provider.dart';
import 'package:saigai01/view/pages/friend/friend.dart';
import 'package:saigai01/view/pages/map/map.dart';
import 'package:saigai01/view/pages/public_off/public_off.dart';
import 'package:saigai01/view/pages/settings/settings.dart';

class PageRoot extends HookConsumerWidget {
  const PageRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageRootState = ref.watch(pageRootProvider);
    final pageRootController = ref.watch(pageRootProvider.notifier);

    final List<Widget> bar = [
      const MapPage(),
      const public_offpage(),
      const Friend(),
      const SettingPage(),
    ];

    return Scaffold(
      body: bar[pageRootState.index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          pageRootController.state = Bar.values[index];
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public_off),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          )
        ],
        currentIndex: pageRootState.index,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

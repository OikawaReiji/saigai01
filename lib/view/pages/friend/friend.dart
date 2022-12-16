import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/hex_color.dart';
import '../../../compornet/friend/friend_status.dart';
import '../../../provider/general_provider.dart';
import 'friend_add.dart';

class Friend extends HookConsumerWidget {
  const Friend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsListControllerProvider);
    return Scaffold(
      backgroundColor: HexColor("#3E3C3C"),
      appBar: AppBar(
        title: const Text("フレンド"),
        centerTitle: true,
        backgroundColor: HexColor("#3E3C3C"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, FriendAdd.id);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Icon(
                Icons.person_add,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FriendStatus(
                title: "危険",
                titleColor: Colors.red,
                friends: friends.where((e) => e.status == "danger").toList(),
              ),
              FriendStatus(
                title: "やや危険",
                titleColor: Colors.orange,
                friends:
                    friends.where((e) => e.status == "little_danger").toList(),
              ),
              FriendStatus(
                title: "やや安全",
                titleColor: const Color.fromARGB(255, 0, 131, 7),
                friends:
                    friends.where((e) => e.status == "little_safety").toList(),
              ),
              FriendStatus(
                title: "安全",
                titleColor: Colors.lightGreen,
                friends: friends.where((e) => e.status == "safety").toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

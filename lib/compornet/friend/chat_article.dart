import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/general_provider.dart';
import 'package:intl/intl.dart' show DateFormat;

class ChatArticle extends HookConsumerWidget {
  const ChatArticle(
      {super.key,
      required this.text,
      required this.time,
      required this.senderUid});
  final String text;
  final DateTime time;
  final String senderUid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsListControllerProvider);
    final myState = ref.watch(usersControllerProvider);
    final sender = myState!.uid == senderUid
        ? myState
        : friends.singleWhere((e) => e.uid == senderUid);

    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55,
                height: 55,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: sender.profileImage != ""
                      ? DecorationImage(
                          image: NetworkImage(sender.profileImage),
                        )
                      : const DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage("assets/img/iii.jpg"),
                        ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          sender.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          DateFormat('yyyy/MM/dd').format(time),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 196, 196, 196),
                        fontSize: 19,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

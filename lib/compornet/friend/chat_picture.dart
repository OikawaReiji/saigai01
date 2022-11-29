import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
import '../../provider/general_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatPicture extends HookConsumerWidget {
  const ChatPicture(
      {super.key,
      required this.url,
      required this.time,
      required this.senderUid});
  final String url;
  final DateTime time;
  final String senderUid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsListControllerProvider);
    final myState = ref.watch(usersControllerProvider);
    final sender = myState!.uid == senderUid
        ? myState
        : friends.singleWhere((e) => e.uid == senderUid);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(right: 15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          sender.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
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
                    const SizedBox(height: 5),
                    CachedNetworkImage(
                      imageUrl: url,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

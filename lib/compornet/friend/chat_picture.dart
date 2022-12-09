import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:saigai01/view/pages/friend/image_view.dart';
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
          const SizedBox(height: 15),
          Row(
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
                    InkWell(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ImageView(
                                    url: url,
                                  ))))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          imageUrl: url,
                          placeholder: (context, url) => Container(
                            width: double.infinity,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                            ),
                            child: const Center(
                              child: Icon(Icons.cloud_upload_outlined),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

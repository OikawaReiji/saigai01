import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/constant/chat_argment.dart';

import '../../model/users_state.dart';
import '../../provider/general_provider.dart';
import '../../view/pages/friend/chat.dart';

class FriendStatus extends HookConsumerWidget {
  const FriendStatus({
    super.key,
    required this.titleColor,
    required this.title,
    required this.friends,
  });
  final Color titleColor;
  final String title;
  final List<UsersState> friends;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title - ${friends.length}",
          style: TextStyle(
            color: titleColor,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          children: List.generate(
            friends.length,
            (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          friends[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Chat.id,
                            arguments: ChatArgment(usersState: friends[index]),
                          );
                        },
                        child: Icon(
                          Icons.sms_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

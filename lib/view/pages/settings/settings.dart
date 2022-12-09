import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/auth/my_bar.dart';
import 'package:saigai01/view/pages/settings/notice.dart';
import 'package:saigai01/view/pages/settings/profile.dart';
import '../../../compornet/setting/log_out_dialog.dart';
import '../../../compornet/setting/safe_sheet.dart';
import '../../../constant/hex_color.dart';
import '../../../provider/general_provider.dart';
import '../friend/friend_add.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double topWidgetHeight = 150.0;
    const double avatarRadius = 50.0;
    final userState = ref.watch(usersControllerProvider);
    final statusColor = userState!.status == "danger"
        ? Colors.red
        : userState.status == "little_danger"
            ? Colors.orange
            : userState.status == "little_safety"
                ? const Color.fromARGB(255, 0, 131, 7)
                : Colors.lightGreen;
    return Scaffold(
      backgroundColor: HexColor("#3F3F3F"),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                userState.headerImage != ""
                    ? CachedNetworkImage(
                        height: topWidgetHeight,
                        imageUrl: userState.headerImage,
                        fadeInDuration: const Duration(milliseconds: 0),
                        fadeOutDuration: const Duration(milliseconds: 0),
                      )
                    : Container(
                        height: topWidgetHeight,
                        color: Colors.blueAccent,
                      ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 15),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  userState.name,
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 45,
                        child: Stack(
                          children: [
                            MyBar(
                              text: 'ステータスを設定',
                              icon: Icons.account_circle_outlined,
                              icon2: Icons.arrow_forward_ios,
                              function: () async {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const SafeSheet(),
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 10,
                                height: 10,
                                margin: const EdgeInsets.only(right: 50),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: statusColor,
                                ),
                              ),
                            )
                          ],
                        ),

                      ),
                      MyBar(
                        text: 'プロフィール編集',
                        icon: Icons.edit_outlined,
                        icon2: Icons.arrow_forward_ios,
                        function: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ),
                          );
                        },
                      ),
                      MyBar(
                        text: 'フレンド追加',
                        icon: Icons.person_add,
                        icon2: Icons.arrow_forward_ios,
                        function: () async {
                          Navigator.pushNamed(context, FriendAdd.id);
                        },
                      ),
                      MyBar(
                        text: 'お問い合わせ・バグ報告',
                        icon: Icons.info_outline,
                        icon2: Icons.arrow_forward_ios,
                        function: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Notice(),
                            ),
                          );
                        },
                      ),
                      MyBar(
                        text: "ログアウト",
                        icon: Icons.logout,
                        icon2: Icons.arrow_forward_ios,
                        function: () async {
                          // await authController.signout();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LogOutDialog(
                                  title: "ログアウト",
                                  subText: "本当にログアウトしますか？",
                                );
                              });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 15,
              top: topWidgetHeight - avatarRadius,
              child: userState.profileImage != ""
                  ? CachedNetworkImage(
                      imageUrl: userState.profileImage,
                      imageBuilder: (context, imageProvider) => Container(
                        width: avatarRadius * 2,
                        height: avatarRadius * 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        width: avatarRadius * 2,
                        height: avatarRadius * 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 5),
                          image: const DecorationImage(
                            image: AssetImage("assets/img/iii.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Container(
                      width: avatarRadius * 2,
                      height: avatarRadius * 2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 5),
                        image: const DecorationImage(
                          image: AssetImage("assets/img/iii.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

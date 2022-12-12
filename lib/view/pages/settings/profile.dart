import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saigai01/compornet/setting/edit_text_dialog.dart';
import 'package:saigai01/constant/hex_color.dart';
import 'package:saigai01/controller/users_controller.dart';
import '../../../compornet/setting/edit_profile_bar.dart';
import '../../../compornet/setting/picture_dialog.dart';
import '../../../compornet/setting/safe_sheet.dart';
import '../../../provider/general_provider.dart';

class Profile extends HookConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double topWidgetHeight = 150.0;
    const double avatarRadius = 50.0;
    final userState = ref.watch(usersControllerProvider);
    final userCTL = ref.watch(usersControllerProvider.notifier);
    final size = MediaQuery.of(context).size;
    final String userStatus = userState!.status == "danger"
        ? "危険"
        : userState.status == "little_danger"
            ? "やや危険"
            : userState.status == "little_safety"
                ? "やや安全"
                : userState.status == "safety"
                    ? "安全"
                    : "安全";

    return Scaffold(
      backgroundColor: HexColor("#615C5C"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 62, 60, 60),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Text(
              '戻る',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: [
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
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return PictureDialog(
                              cameraFunction: () async {
                                await userCTL.getImage(
                                  ImageSource.camera,
                                  CropAspectRatio(
                                      ratioX: size.width,
                                      ratioY: topWidgetHeight),
                                  null,
                                  ImageSelect.header,
                                );
                              },
                              galleryFunction: () async {
                                await userCTL.getImage(
                                  ImageSource.gallery,
                                  CropAspectRatio(
                                      ratioX: size.width,
                                      ratioY: topWidgetHeight),
                                  null,
                                  ImageSelect.header,
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 62, 60, 60),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
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
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  userState.name,
                                  style: const TextStyle(
                                      fontSize: 22, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return EditTextDialog(
                                        hintText: userState.name,
                                        title: "名前の変更",
                                        select: TextSelect.name,
                                      );
                                    },
                                  );
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      EditProfileBar(
                        title: "status",
                        text: userStatus,
                        function: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                const SafeSheet(),
                          );
                        },
                      ),
                      EditProfileBar(
                        title: "Address",
                        text:
                            userState.address != "" ? userState.address : "未設定",
                        function: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditTextDialog(
                                hintText: userState.address,
                                title: "住所の変更",
                                select: TextSelect.address,
                              );
                            },
                          );
                        },
                      ),
                      EditProfileBar(
                        title: "Phone",
                        text: userState.phone,
                        function: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return EditTextDialog(
                                hintText: userState.phone,
                                title: "電話番号の変更",
                                select: TextSelect.phone,
                              );
                            },
                          );
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 80,
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: HexColor("#2e3037"),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "notification",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color.fromARGB(
                                              255, 188, 188, 188),
                                        ),
                                      ),
                                      Text(
                                        userState.notificationFlg
                                            ? "通知設定 ON"
                                            : "通知設定 OFF",
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  value: userState.notificationFlg,
                                  onChanged: (val) async {
                                    await userCTL.updateFlg(val);
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 15,
            top: topWidgetHeight - avatarRadius,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                userState.profileImage != ""
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
                Positioned(
                  right: -5,
                  top: -5,
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PictureDialog(
                            cameraFunction: () async {
                              await userCTL.getImage(
                                ImageSource.camera,
                                const CropAspectRatio(ratioX: 1, ratioY: 1),
                                CropStyle.circle,
                                ImageSelect.circle,
                              );
                            },
                            galleryFunction: () async {
                              await userCTL.getImage(
                                ImageSource.gallery,
                                const CropAspectRatio(ratioX: 1, ratioY: 1),
                                CropStyle.circle,
                                ImageSelect.circle,
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 62, 60, 60),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

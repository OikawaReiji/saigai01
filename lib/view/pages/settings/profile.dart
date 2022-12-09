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
                  Container(
                    height: topWidgetHeight,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      image: userState.headerImage != ""
                          ? DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: NetworkImage(userState.headerImage),
                            )
                          : null,
                    ),
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
                Container(
                  width: avatarRadius * 2 + 12,
                  height: avatarRadius * 2 + 12,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      width: avatarRadius * 2,
                      height: avatarRadius * 2,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: userState.profileImage != ""
                            ? DecorationImage(
                                image: NetworkImage(userState.profileImage),
                              )
                            : const DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage("assets/img/iii.jpg"),
                              ),
                      ),
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
          )
        ],
      ),
    );
  }
}

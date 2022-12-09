import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saigai01/compornet/friend/chat_article.dart';
import 'package:saigai01/compornet/friend/chat_picture.dart';
import 'package:saigai01/constant/chat_argment.dart';
import '../../../constant/hex_color.dart';
import '../../../provider/general_provider.dart';

class Chat extends HookConsumerWidget {
  const Chat({super.key});
  static String id = "chat";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as ChatArgment;
    debugPrint("チャットページ遷移${args.usersState.uid}");
    final chatState = ref.watch(chatControllerProvider(args.usersState.uid));
    final textController = useTextEditingController(text: "");
    final textFlg = useState(false);
    final chatCTL =
        ref.watch(chatControllerProvider(args.usersState.uid).notifier);

    return Scaffold(
      backgroundColor: HexColor("#3E3C3C"),
      appBar: AppBar(
        backgroundColor: HexColor("#3E3C3C"),
        title: Text("${args.usersState.name} さんとのチャット"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: List.generate(
                chatState.length,
                (index) {
                  return !chatState[index].imageFlg
                      ? ChatArticle(
                          text: chatState[index].text,
                          time: chatState[index].registeTime,
                          senderUid: chatState[index].sender,
                        )
                      : ChatPicture(
                          url: chatState[index].imageUrl,
                          time: chatState[index].registeTime,
                          senderUid: chatState[index].sender,
                        );
                },
              ),
            ),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: HexColor("#3E3C3C"),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    await chatCTL.sendChatImage(
                        args.usersState.uid, ImageSource.gallery);
                    textFlg.value = false;
                    textController.text = "";
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: HexColor("#222629"),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: HexColor("#A3A7A8"),
                        size: 25,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await chatCTL.sendChatImage(
                        args.usersState.uid, ImageSource.camera);
                    textFlg.value = false;
                    textController.text = "";
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: HexColor("#222629"),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.photo_camera_outlined,
                        color: HexColor("#A3A7A8"),
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: HexColor("#222629"),
                      borderRadius: BorderRadius.circular(300),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: textController,
                        onChanged: (val) {
                          if (val == "") {
                            textFlg.value = false;
                          } else {
                            textFlg.value = true;
                          }
                        },
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        onTap: () async {},
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                textFlg.value
                    ? InkWell(
                        onTap: () async {
                          if (textController.text != "") {
                            await chatCTL.sendChat(textController.text,
                                args.usersState.uid, false, "");
                            textFlg.value = false;
                            textController.text = "";
                          } else {}
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.send,
                            color: HexColor("#A3A7A8"),
                            size: 30,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/auth/my_textfield.dart';

import '../../provider/general_provider.dart';

class Sign extends HookConsumerWidget {
  const Sign({super.key});
  static String id = "Sign";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final authPageStateController =
        ref.watch(authSwitcherPriovider.notifier); //変更　関数の実行
    final authController = ref.watch(authControllerProvider.notifier);
    final maillContainer = useTextEditingController(text: "");
    final passContainer = useTextEditingController(text: "");
    final nameContainer = useTextEditingController(text: "");
    final phoneContainer = useTextEditingController(text: "");

    final ValueNotifier<bool> loading = useState(false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 63, 63),
      appBar: AppBar(
        title: const Text(
          "新規登録",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            authPageStateController.state = Pages.top;
          },
          child: const Icon(Icons.arrow_back_outlined),
        ),
        backgroundColor: const Color.fromARGB(255, 63, 63, 63),
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      MyTextfield(
                        title: 'email',
                        icon: Icon(
                          Icons.mail,
                          size: 40,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        controller: maillContainer,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextfield(
                        title: 'password',
                        icon: Icon(
                          Icons.lock,
                          size: 40,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        controller: passContainer,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextfield(
                        title: 'name',
                        icon: Icon(
                          Icons.badge_outlined,
                          size: 40,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        controller: nameContainer,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyTextfield(
                        title: 'phone',
                        icon: Icon(
                          Icons.phone_in_talk,
                          size: 40,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        controller: phoneContainer,
                      ),
                      const SizedBox(
                        height: 180,
                      ),
                      InkWell(
                        onTap: () async {
                          loading.value == true;
                          try {
                            await authController.signUp(
                                maillContainer.text,
                                passContainer.text,
                                nameContainer.text,
                                phoneContainer.text);
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 65,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 13, 245, 227),
                                  width: 4),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: const Center(
                            child: Text(
                              "登録",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Color.fromARGB(255, 13, 245, 227)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          loading.value
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

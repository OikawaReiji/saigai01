import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/general_provider.dart';

import 'package:saigai01/view/auth/top.dart';
import 'package:saigai01/view/auth/login.dart';
import 'package:saigai01/view/auth/sign.dart';
import 'package:saigai01/view/pages/page_root.dart';

class Separate extends HookConsumerWidget {
  const Separate({super.key});
  static String id = "separate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final authPageState = ref.watch(authSwitcherPriovider);
    final messaging = FirebaseMessaging.instance;

    return FutureBuilder(
      future: Future<void>(
        () async {
          debugPrint("メッセージ送信の許可取り");
          await messaging.requestPermission(
            alert: true,
            announcement: false,
            badge: true,
            carPlay: false,
            criticalAlert: false,
            provisional: false,
            sound: true,
          );
        },
      ),
      builder: ((context, snapshot) {
        if (authState == null) {
          switch (authPageState) {
            case Pages.top:
              return const Top();
            case Pages.signUp:
              return const Sign();
            case Pages.login:
              return const Login();
            default:
              return const Top();
          }
        } else {
          return const PageRoot();
        }
      }),
    );
  }
}

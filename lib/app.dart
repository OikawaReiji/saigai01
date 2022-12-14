import 'package:flutter/material.dart';
import 'package:saigai01/view/pages/friend/chat.dart';
import 'package:saigai01/view/pages/friend/friend_add.dart';
import 'package:saigai01/view/pages/map/shellter_detail.dart';

import 'view/auth/top.dart';
import 'view/auth/login.dart';
import 'view/auth/Sign.dart';
import 'view/separate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: Separate.id,
      routes: <String, WidgetBuilder>{
        Login.id: (BuildContext context) => const Login(),
        Top.id: (BuildContext context) => const Top(),
        Sign.id: (BuildContext context) => const Sign(),
        Separate.id: (BuildContext context) => const Separate(),
        // AccountPage.id: (BuildContext context) => const AccountPage(),
        ShellterDetails.id: (BuildContext context) => const ShellterDetails(),
        FriendAdd.id: (BuildContext context) => FriendAdd(),
        Chat.id: (BuildContext context) => const Chat(),
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'view/auth/Top.dart';
import 'view/auth/login.dart';
import 'view/auth/Sign.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: Top.id,
      routes: <String, WidgetBuilder>{
        Login.id: (BuildContext context) => const Login(),
        Top.id: (BuildContext context) => const Top(),
        Sign.id: (BuildContext context) => const Sign(),
      },
    );
  }
}

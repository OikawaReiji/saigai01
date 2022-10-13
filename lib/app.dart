import 'package:flutter/material.dart';

import 'view/auth/Top.dart';
import 'view/auth/login.dart';
import 'view/first.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Top.id,
      routes: <String, WidgetBuilder>{
        First.id: (BuildContext context) => const First(),
        Login.id: (BuildContext context) => const Login(),
        Top.id:(BuildContext context) => const Top(),
      },
    );
  }
}

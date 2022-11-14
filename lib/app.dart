import 'package:flutter/material.dart';
import 'package:saigai01/view/pages/map/map_search.dart';
import 'package:saigai01/view/pages/map/shellter_detail.dart';

import 'view/auth/Top.dart';
import 'view/auth/login.dart';
import 'view/auth/Sign.dart';
import 'view/separate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Separate.id,
      routes: <String, WidgetBuilder>{
        Login.id: (BuildContext context) => const Login(),
        Top.id: (BuildContext context) => const Top(),
        Sign.id: (BuildContext context) => const Sign(),
        Separate.id: (BuildContext context) => const Separate(),
        ShellterDetails.id: (BuildContext context) => const ShellterDetails(),
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'view/auth/login.dart';
import 'view/auth/Sign.dart';
import 'view/first.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: Sign.id,
=======
      initialRoute: First.id,
>>>>>>> 20ecfcc309b5bbc6630f3b84d332d921c96cf501
      routes: <String, WidgetBuilder>{
        First.id: (BuildContext context) => const First(),
        Login.id: (BuildContext context) => const Login(),
        Sign.id: (BuildContext context) => const Sign(),
      },
    );
  }
}

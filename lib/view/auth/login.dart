import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static String id = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 155, 155),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: TextFormField(
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        size: 40,
                        color: Colors.brown,
                      ),
                      hintText: "email",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 155, 155),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: TextFormField(
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        size: 40,
                        color: Colors.brown,
                      ),
                      hintText: "email",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  debugPrint("破壊");
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 155, 155),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Text(
                      "ログイン",
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

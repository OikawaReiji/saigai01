import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static String id = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 63, 63, 63),
      appBar: AppBar(
        title: Text(
          "ログイン",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_outlined),
        backgroundColor: Color.fromARGB(255, 63, 63, 63),
        elevation: 0.0,
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
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    color: Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: TextFormField(
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      hintText: "email",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
                    border:
                        Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: TextFormField(
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        size: 40,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      hintText: "password",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                  height: 65,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 13, 245, 227), width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Center(
                    child: Text(
                      "ログイン",
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
    );
  }
}

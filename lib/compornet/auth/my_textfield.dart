import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.ispassword,
    required this.name,
  });
  final String title;
  final Icon icon;
  final TextEditingController controller;
  final bool ispassword;
  final TextInputType name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Center(
        child: TextFormField(
          keyboardType: name,
          obscureText: ispassword,
         controller: controller,
          style: const TextStyle(fontSize: 25, color: Colors.white),
          decoration: InputDecoration(
              icon: icon,
              hintText: title,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

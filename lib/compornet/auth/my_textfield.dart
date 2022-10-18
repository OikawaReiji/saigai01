import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
  });
  final String title;
  final Icon icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Center(
        child: TextFormField(
          controller: controller,
          style: const TextStyle(fontSize: 25, color: Colors.white),
          decoration: InputDecoration(
              icon: icon,
              hintText: title,
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

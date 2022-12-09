import 'package:flutter/material.dart';

class EditBar extends StatelessWidget {
  const EditBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 62, 60, 60),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: TextFormField(
          style: const TextStyle(fontSize: 25, color: Colors.white),
          decoration: const InputDecoration(
              hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

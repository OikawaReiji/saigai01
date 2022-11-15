import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class edit_bar extends StatelessWidget {
  const edit_bar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 62, 60, 60),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Center(
        child: TextFormField(
          style: const TextStyle(fontSize: 25, color: Colors.white),
          decoration: InputDecoration(
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

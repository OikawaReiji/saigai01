import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({
    super.key,
    required this.text,
    required this.icon,
    required this.icon2,
  });
  final String text;
  final IconData icon;
  final IconData icon2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 25)),
          const Spacer(),
          Icon(
            icon2,
            size: 30,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}

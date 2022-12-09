import 'package:flutter/material.dart';

class AccountBar extends StatelessWidget {
  const AccountBar({
    super.key,
    required this.text,
    required this.text2,
    required this.icon,
    required stream,
  });
  final String text;
  final String text2;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 62, 60, 60),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 15)),
          const SizedBox(
            width: 90,
          ),
          Text(text2,
              style: const TextStyle(color: Colors.white, fontSize: 10)),
          const Spacer(),
          Icon(
            icon,
            size: 30,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}

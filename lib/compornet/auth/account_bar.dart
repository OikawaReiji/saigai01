import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 62, 60, 60),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 15)),
          SizedBox(
            width: 90,
          ),
          Text(text2, style: TextStyle(color: Colors.white, fontSize: 10)),
          Spacer(),
          Icon(
            icon,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
    );
  }
}

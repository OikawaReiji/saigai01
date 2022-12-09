import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({
    super.key,
    required this.text,
    required this.icon,
    required this.icon2,
    required this.function,
  });
  final String text;
  final IconData icon;
  final IconData icon2;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => function(),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Icon(
                icon,
                size: 25,
                color: const Color.fromARGB(255, 157, 157, 157),
              ),
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Spacer(),
            Icon(
              icon2,
              size: 20,
              color: const Color.fromARGB(255, 157, 157, 157),
            ),
          ],
        ),
      ),
    );
  }
}

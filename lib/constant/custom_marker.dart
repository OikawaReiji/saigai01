import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      width: 72.0,
      child: Stack(
        children: [
          Image.asset(
            'assets/marker_icon.png',
            fit: BoxFit.fill,
          ),
          Align(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                "〇",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

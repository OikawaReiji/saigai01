import 'package:flutter/material.dart';
import '../../constant/hex_color.dart';

class EditProfileBar extends StatelessWidget {
  const EditProfileBar(
      {super.key,
      required this.title,
      required this.text,
      required this.function});
  final String title;
  final String text;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: HexColor("#2e3037"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 188, 188, 188),
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await function();
                },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: HexColor("#4f535c"),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../constant/hex_color.dart';
import '../../model/earthquake/earthquake.dart';
import '../../view/pages/public_off/quake_detail.dart';
import 'package:intl/intl.dart' show DateFormat;

class QuakePanel extends StatelessWidget {
  const QuakePanel({
    super.key,
    required this.quake,
  });
  final Earthquake quake;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => quake_detail(
              quake: quake,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: HexColor('#000000'),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(
              quake.magnitude,
              style: TextStyle(
                fontSize: 50,
                color: double.parse(quake.magnitude) >= 5
                    ? HexColor("#CE0000")
                    : HexColor("#15CE00"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quake.hypocenter,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateFormat('MM/dd HH:mm')
                        .format(DateTime.parse(quake.originDateTime)),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "最大震度 ${quake.maxInt}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}

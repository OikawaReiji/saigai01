import 'package:flutter/material.dart';
import '../../../constant/hex_color.dart';
import '../../../model/earthquake/earthquake.dart';
import 'package:intl/intl.dart' show DateFormat;

class quake_detail extends StatelessWidget {
  const quake_detail({
    super.key,
    required this.quake,
  });
  final Earthquake quake;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("3F3F3F"),
      appBar: AppBar(
        backgroundColor: HexColor("#3F3F3F"),
        centerTitle: true,
        title: const Text(
          "地震最新情報",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: NetworkImage(
                    "http://files.quake.one/${quake.eventID}/image.png"),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor(
                    "#0F1214",
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      quake.hypocenter,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      DateFormat('MM月dd日 HH:mm')
                          .format(DateTime.parse(quake.originDateTime)),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor(
                            "#0F1214",
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quake.magnitude,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                            const Text(
                              "マグニチュード",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor(
                            "#0F1214",
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              quake.maxInt,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                            const Text(
                              "最大震度",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

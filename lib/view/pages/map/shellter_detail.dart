import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/general_provider.dart';

import '../../../constant/hex_color.dart';

class ShellterDetails extends HookConsumerWidget {
  const ShellterDetails({
    super.key,
  });
  static String id = "shellter_details";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsState = ref.watch(detailsProvider);
    List<String> saigai = [
      "洪水",
      "崖崩れ",
      "高潮",
      "地震",
      "津波",
      "氾濫",
      "火山",
      "火事",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#3F3F3F"),
        centerTitle: true,
        title: const Text(
          "避難所詳細",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
      backgroundColor: HexColor("#3F3F3F"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                margin: const EdgeInsets.only(bottom: 15, top: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.corporate_fare_outlined,
                          color: Colors.white,
                          size: 45,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            detailsState!.properties.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          color: Colors.white,
                          size: 45,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            detailsState.properties.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "対応災害",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        String flg = "";
                        switch (index) {
                          case 0:
                            flg = detailsState.properties.flood;
                            break;
                          case 1:
                            flg = detailsState.properties.landslide;
                            break;
                          case 2:
                            flg = detailsState.properties.surge;
                            break;
                          case 3:
                            flg = detailsState.properties.earthquake;
                            break;
                          case 4:
                            flg = detailsState.properties.tsunami;
                            break;
                          case 5:
                            flg = detailsState.properties.fire;
                            break;
                          case 6:
                            flg = detailsState.properties.inlandFlood;
                            break;
                          case 7:
                            flg = detailsState.properties.volcano;
                            break;
                          case 8:
                            flg = detailsState.properties.flood;
                            break;
                        }
                        return Column(
                          children: [
                            Text(
                              saigai[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Icon(
                              flg == "◎" ? Icons.circle_outlined : Icons.close,
                              color: Colors.white,
                              size: 50,
                            )
                          ],
                        );
                      },
                      shrinkWrap: true,
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

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/compornet/quake/quake_panel.dart';
import 'package:saigai01/provider/general_provider.dart';

import '../../../constant/hex_color.dart';

class Quake extends HookConsumerWidget {
  const Quake({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quakeState = ref.watch(quakeControllerProvider);
    final quakeCTL = ref.watch(quakeControllerProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: HexColor("#3f3f3f"),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "地震災害情報",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: quakeCTL.feachQuake(),
                builder: (context, snapshot) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: quakeState.objects.isNotEmpty
                          ? Column(
                              children: List.generate(quakeState.objects.length,
                                  (index) {
                                return QuakePanel(
                                  quake: quakeState.objects[index],
                                );
                              }),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

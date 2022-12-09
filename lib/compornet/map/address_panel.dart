import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class AddressPanel extends HookConsumerWidget {
  const AddressPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapVeiwState = ref.watch(mapNaviProvider);
    final navigatingShellter = ref.watch(navigatingShellterProvider);

    return mapVeiwState == MapNavi.route
        ? Align(
            alignment: const Alignment(0, -1),
            child: SafeArea(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: navigatingShellter!.properties.name,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                          text: 'まで', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

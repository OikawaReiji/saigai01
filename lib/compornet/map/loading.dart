import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class Loading extends HookConsumerWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapVeiwState = ref.watch(mapNaviProvider);
    final mapViewController = ref.watch(mapNaviProvider.notifier);
    return mapVeiwState == MapNavi.loading
        ? Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : const SizedBox();
  }
}

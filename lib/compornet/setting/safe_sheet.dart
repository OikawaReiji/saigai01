import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/users_controller.dart';
import '../../provider/general_provider.dart';

class SafeSheet extends HookConsumerWidget {
  const SafeSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCTL = ref.watch(usersControllerProvider.notifier);

    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const Text('危険'),
          onPressed: () async {
            await userCTL.updateText(
              "danger",
              TextSelect.safe,
              () => Navigator.pop(context),
            );
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('やや危険'),
          onPressed: () async {
            await userCTL.updateText(
              "little_danger",
              TextSelect.safe,
              () => Navigator.pop(context),
            );
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('やや安全'),
          onPressed: () async {
            await userCTL.updateText(
              "little_safety",
              TextSelect.safe,
              () => Navigator.pop(context),
            );
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('安全'),
          onPressed: () async {
            await userCTL.updateText(
              "safety",
              TextSelect.safe,
              () => Navigator.pop(context),
            );
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
        child: const Text('キャンセル'),
      ),
    );
  }
}

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/provider/general_provider.dart';
import 'package:saigai01/repository/auth_repository.dart';
import 'package:saigai01/view/auth/Top.dart';
import 'package:saigai01/view/pages/page_root.dart';

class Separate extends HookConsumerWidget {
  const Separate({super.key});
  static String id = "separate";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    if (authState == null) {
      return const Top();
    } else {
      return const PageRoot();
    }
  }
}

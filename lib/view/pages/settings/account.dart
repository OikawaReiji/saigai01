import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saigai01/view/pages/settings/adrr_edit.dart';
import 'package:saigai01/view/pages/settings/mail_edit.dart';
import 'package:saigai01/view/pages/settings/phone_edit.dart';
import '../../../compornet/auth/account_bar.dart';
import '../../../constant/hex_color.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});
  static String id = "Account";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: HexColor("#615C5C"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 62, 60, 60),
        centerTitle: true,
        title: const Text("アカウント"),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '戻る',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MailEdit(),
                      ),
                    );
                  },
                  child: const AccountBar(
                    text: 'メールアドレス',
                    text2: 'NNNNNN@NNNNNN',
                    icon: Icons.arrow_forward_ios,
                    stream: null,
                  ),
                ),
                const SizedBox(height: 1),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const phone_edit(),
                      ),
                    );
                  },
                  child: const AccountBar(
                    text: '電話番号　　　',
                    text2: '+ xxx-xxx-xxxx',
                    icon: Icons.arrow_forward_ios,
                    stream: null,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const addr_edit(),
                      ),
                    );
                  },
                  child: const AccountBar(
                    text: '現在の住所　　',
                    text2: 'NN県NN市NN町N-N',
                    icon: Icons.arrow_forward_ios,
                    stream: null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// ローカルブランチでmainブランチに入る
//     > git checkout main

// mainブランチの更新があるか確認
//     > git pull

// featureブランチを切って移動する
//     > git checkout -b feature/ブランチ名

// 現在地確認 　　"feature/ブランチ名"だったらOK
//     > git branch

// ー－－開発するー－－

// ー－－開発完了ー－－

// 変更点をコミットする
//     > git add .
//     > git commit -m "メッセージ"

// GitHubにプッシュする
//     > git push origin feature/ブランチ名

import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
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

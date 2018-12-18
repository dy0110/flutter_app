// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_world/main.dart';

void main() {
  // async 非同期メソッドを定義
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // await処理が完了するまで待機する
    // ウィジェットを動かす
    await tester.pumpWidget( new MyApp() ); // MyAppのインスタンスを作りUIの生成テスト
    await tester.pump();  // フレームにトリガーを送り、ウィジェットを描画する

    // 第1引き数が第２引数と同じものかどうかチェック
    expect(find.byIcon(Icons.star), findsOneWidget);

  });
}

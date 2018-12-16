import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final title = 'Flutter サンプル';
  final message = 'ハローワールド'; 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      // StatefulWidgetへ値を渡す
      home: new MyHomePage(
        title: this.title,
        message: this.message,
      )
    );
  }
}

// ウィジェットクラス
class MyHomePage extends StatefulWidget {
  final String title;
  final String message;

  // コンストラクタを定義する
  MyHomePage({
    this.title,
    this.message
  }): super();

  // ステートクラスのインスタンスを作成
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  // buildメソッドでScaffoldオブジェクトを返えす
  // Stateが更新されるたびに新しい表示内容を動的に生成するs
  @override
  Widget build( BuildContext context ){

    // widget( Stateクラスのプロパティ ) => 親のウィジェットのインスタンスのプロパティが代入される
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        widget.message,
        style: TextStyle( fontSize: 32.0 ),
        ),
    );
  }
}

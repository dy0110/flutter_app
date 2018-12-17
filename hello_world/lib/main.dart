import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final title = 'Flutter サンプル';
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      // StatefulWidgetへ値を渡す
      home: new MyHomePage(
        title: this.title
      )
    );
  }
}

// ウィジェットクラス
class MyHomePage extends StatefulWidget {
  final String title;

  // コンストラクタを定義する
  MyHomePage({
    this.title
  }): super();

  // ステートクラスのインスタンスを作成
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  String _message;

  //メソッドを定義
  // Stateクラスのプロパティの初期化(initStateメソッド)
  // ウィジェットの組み込みが完了した時点で呼び出し
  @override
  void initState(){
    super.initState();
    _message = 'ハロー！';
  }

  // Stateの更新メソッド(setStateメソッド)
  // ステートの更新をステートクラスに知らせる働き
  void _setMessage(){
    setState(() {
          _message = 'タップしました！';
        });
  }

  // buildメソッドでScaffoldオブジェクトを返えす
  // Stateが更新されるたびに新しい表示内容を動的に生成する
  @override
  Widget build( BuildContext context ){

    // widget( Stateクラスのプロパティ ) => 親のウィジェットのインスタンスのプロパティが代入される
    return Scaffold(
      // アプリのステータスバー
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // ボディ部分
      body: Text(
        _message,
        style: TextStyle( fontSize: 32.0 ),
        ),
      // フローティングアクションボタンを定義
      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage, // ボタンをタップした時のイベントを定義
        tooltip: 'メッセージをセット', // ツールチップ
        child: Icon(Icons.star), // フロートボタンの子ウィジェット(アイコン)
      ),
    );
  }
}

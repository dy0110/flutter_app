import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

// StatelessWidgetクラス
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

// StatefulWidgetクラス
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

// Dataクラスを定義して複雑な値を扱う
class Data {
  // ローカル変数を定義
  int _price;
  String _name;

  // コンストラクタを定義
  Data(this._name, this._price):super();

  // メソッドを定義
  // toStringメソッドをオーバーライドして文字列とするメソッドを定義
  @override
  String toString(){
    return _name + ':' + _price.toString() + '円';
  }
}

// Stateクラスを定義
class _MyHomePageState extends State<MyHomePage>{
  // サンプルデータを定義(Dataインスタンスをリスト化)
  static final _data = [
    Data('りんご', 200),
    Data('オレンジ', 150),
    Data('もも', 300)
  ];
  // 選択されたDataを保管するプロパティ
  Data _item;

  //メソッドを定義
  // Stateクラスのプロパティの初期化(initStateメソッド)
  // ウィジェットの組み込みが完了した時点で呼び出し
  @override
  void initState(){
    super.initState();
    _item = _data[0]; // 最初の値をセット
  }

  // Stateの更新メソッド(setStateメソッド)
  // ステートの更新をステートクラスに知らせる働き
  void _setData(){
    setState(() {
          _item = (_data..shuffle()).first;
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
        _item.toString(),
        style: TextStyle( fontSize: 32.0 ),
        ),
      // フローティングアクションボタンを定義
      floatingActionButton: FloatingActionButton(
        onPressed: _setData, // ボタンをタップした時のイベントを定義(参照渡し)
        tooltip: 'くだものと値段', // ツールチップ
        child: Icon(Icons.star), // フロートボタンの子ウィジェット(アイコン)
      ),
    );
  }
}

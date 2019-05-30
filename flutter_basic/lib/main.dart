

//import 'dart:async' show Future;

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


void main(){
  //可视化布局调试开关
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),
      //注册路由表
      routes: {
        'new_page' : (context) => NewRoute(),
        'echo_page' : (context) => EchoRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

//    return Echo(text: 'hello world!',);

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(TextSpan(
            children: [
              TextSpan(
                text: 'hhahahaha',
                style: TextStyle(
                  color: Colors.red,
                  backgroundColor: Colors.yellow
                )

              ),
              TextSpan(
                text: 'uuuuuuuuuuu',
                style: TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.lineThrough
                )
              )
            ],
        )),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('Click to push'),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () {
//                Navigator.push(context,
//                    new MaterialPageRoute(
//                        builder: (context) {
//                      return new NewRoute();
//                    },
//                      fullscreenDialog: true,
//
//                    ));
              //arguments是要往上级传递的参数
              Navigator.pushNamed(context, 'echo_page', arguments: 'This is a callback message');
//              debugDumpApp();
//              debugDumpRenderTree();
//                debugDumpLayerTree();
//              debugPrintStack();//打印调用堆栈

              }


            ),
            RandomWordsWidget(),
            Image.network(
              'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              width: 50,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              repeat: ImageRepeat.repeatY,
            ),
            Icon(Icons.accessible,color: Colors.green,),
            Icon(Icons.help,color: Colors.green,),
            Icon(Icons.fingerprint,color: Colors.red,),
            Icon(MyIcons.github, color: Colors.black,),
            Icon(MyIcons.pay, color: Colors.blue[500],)
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Echo extends StatelessWidget {

  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor : Colors.grey,

  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        child: Text(text),
        color: backgroundColor,
      ),
    );
  }
}


class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New route title'),
      ),
      body: Center(
        child: Text('this is new route'),
      ),
    );
  }
}



class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;
    print(args);

    return CounterWidget();
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('This is a echo title'),
//      ),
//      body: Center(
//        child: Text('this is echo route'),
//      ),
//    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    debugPrint(wordPair.toString());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}



class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue : 0,
  });

  final int initValue;
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  int _counter;
  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('init state');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Text(
              '$_counter',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                backgroundColor: Colors.lightGreen,
                decoration: TextDecoration.underline,
              ),
              textScaleFactor: 4,

            )
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('did update widget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

}


class MyIcons {
  //github图标
  static const IconData github = const IconData(
    0xe65f,
    fontFamily: 'iconfont',
    matchTextDirection: true
  );
  //支付宝图标
  static const IconData pay = const IconData(
      0xe667,
      fontFamily: 'iconfont',
      matchTextDirection: true
  );
}



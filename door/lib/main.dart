import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Door',
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
      home: MyHomePage(title: '开门大法'),
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

  void _httpClient() async {
    try {
      Map dataMap = {"isScan":2,
            "access_token":"a123a37b-4c71-4d1b-b6ae-0592eb519ab7",
            "userId":"1699535220254196450",
            "version":"6.1.0",
            "doorName":"麒麟社3号楼大堂",
            "doorCommunityId":"337",
            "doorId":19209,
            "communityId":"337",
            "customID":"243222958701758167",
            "cardNo":"1103905574"};
      Dio dio = new Dio();
      dio.options.baseUrl = 'https://www.91hilife.com';

      Response response = await dio.post("/erp//front/interface/door/openDoor/three",data: dataMap);
      if (response.statusCode == 200) {
        showAlertDialog(context);
      }
      print(response.statusCode);
    }
    catch (e) {
      print(e);
    }
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("成功"),
            content: new Text("门开了"),
            actions:<Widget>[
              new FlatButton(child:new Text("CANCEL"), onPressed: (){
                Navigator.of(context).pop();

              },),
              new FlatButton(child:new Text("OK"), onPressed: (){
                Navigator.of(context).pop();

              },)
            ]

        ));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: IconButton(
          color: Colors.purple,

          iconSize: 50.0,
          icon: Icon(Icons.lock_open),
          onPressed: _httpClient,

//          child: Icon(Icons.lock_open),
        ),
      ),
    );
  }
}

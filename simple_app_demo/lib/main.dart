import 'package:flutter/material.dart';
import 'package:simple_app_demo/AHTabbarWidget.dart';
import 'package:simple_app_demo/TabbarBottomPageWidget.dart';
import 'package:simple_app_demo/TabbarPageWidget.dart';
//import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "SimpleApp",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("This is a title"),
      ),
      body: new Column(
        children: <Widget>[
          new FlatButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabbarPageWidget()));
              },
              child: new Text("Top tab"),
          ),
          new FlatButton(
              color: Colors.red[50],
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabbarBottomPageWidget()));
          }, child: new Text("Bottom tab"))
        ],
      ),
    );
  }
}

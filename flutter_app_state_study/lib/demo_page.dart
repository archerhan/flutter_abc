import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tableview/demo_item.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
//    return Container();
    return new Scaffold(
        backgroundColor: Colors.blue,
        ///标题栏
        appBar: new AppBar(
          title: new Text("标题"),
        ),
        ///正式的页面开始
        ///一个20个 item 的 ListView
        body: new ListView.builder(
          itemBuilder: (context, index) {
            return new DemoItem();
          },
          itemCount: 20,
        )
    );
  }
  requst() async {
    await Future.delayed(Duration(seconds: 2));
  }
  doSomeThing() async {
    String data = await requst();
    data = "ok from request";
    return data;
  }

  renderSome() {
    doSomeThing().then((value){
      print(value);
      //输出 ok from request
    });
  }

}

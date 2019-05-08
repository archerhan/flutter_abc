import 'package:flutter/material.dart';
import 'package:simple_app_demo/TabbarPageFirst.dart';
import 'package:simple_app_demo/TabbarPageFour.dart';
import 'package:simple_app_demo/TabbarPageSecond.dart';
import 'package:simple_app_demo/TabbarPageThird.dart';
import 'package:simple_app_demo/AHTabbarWidget.dart';

class TabbarPageWidget extends StatefulWidget {
  @override
  _TabbarPageWidgetState createState() => _TabbarPageWidgetState();
}

class _TabbarPageWidgetState extends State<TabbarPageWidget> {
  final PageController topPageController = new PageController();
  final List<String> tab = ["111", "222"];

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(onPressed: (){
        topPageController.jumpTo(MediaQuery.of(context).size.width * i);
      }, child: new Text(
        tab[i],
        maxLines: 1,
      )));
    }
    return list;
  }
  _renderPage() {
    return  [
      new TabbarPageFirst(),
      new TabbarPageSecond(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new AHTabbar(
      title: new Text("Test"),
      type: AHTabbar.TOP_TAB,
      tabItems: _renderTab(),
      tableViews: _renderPage(),
      topPageContrl: topPageController,
      backgroundColor: Colors.lightBlue,
      indicatorColor: Colors.white,
    );
  }
}

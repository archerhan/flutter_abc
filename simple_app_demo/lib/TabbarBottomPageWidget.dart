import 'package:flutter/material.dart';
import 'package:simple_app_demo/TabbarPageFirst.dart';
import 'package:simple_app_demo/TabbarPageFirst.dart';
import 'package:simple_app_demo/TabbarPageSecond.dart';
import 'package:simple_app_demo/TabbarPageThird.dart';
import 'package:simple_app_demo/AHTabbarWidget.dart';

class TabbarBottomPageWidget extends StatefulWidget {
  @override
  _TabbarBottomPageWidgetState createState() => _TabbarBottomPageWidgetState();
}

class _TabbarBottomPageWidgetState extends State<TabbarBottomPageWidget> {
  final PageController topPageControl = new PageController();
  final List<String> tab = ["动态","趋势","我的"];
  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tab.length; i++) {
      list.add(new FlatButton(onPressed: (){
        topPageControl.jumpTo(MediaQuery
            .of(context).size.width * i
        );
      }, child: new Text(
        tab[i],
        maxLines: 1,
      )));
    }
    return list;
  }

  _renderPage() {
    return [
      new TabbarPageFirst(),
      new TabbarPageSecond(),
      new TabbarPageThird()
    ];

  }
  @override
  Widget build(BuildContext context) {
    return new AHTabbar(
      type: AHTabbar.BOTTOM_TAB,
      tabItems: _renderTab(),
      tableViews: _renderPage(),
      topPageContrl: topPageControl,
      backgroundColor: Colors.black45,
      indicatorColor: Colors.white,
      title: new Text("AHGithubFlutter")
    );
  }
}

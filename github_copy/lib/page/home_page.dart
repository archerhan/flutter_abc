/**
 * @author Archer
 * @date 2019-04-18
 * Description: 首页
 */
import 'package:flutter/material.dart';

import 'package:github_copy/page/dynamic_page.dart';
import 'package:github_copy/page/rank_page.dart';
import 'package:github_copy/page/me_page.dart';
import 'package:github_copy/Widgets/hyc_tabbar_widget.dart';
import 'package:github_copy/common/style/hyc_style.dart';
import 'package:github_copy/Widgets/hyc_title_bar.dart';

class HomePage extends StatelessWidget {
  
  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(HycIcons.MAIN_DT, "动态"),
      _renderTab(HycIcons.MAIN_QS, "趋势"),
      _renderTab(HycIcons.MAIN_MY, "我的")
    ];
    return WillPopScope(
      onWillPop: () {
        ///处理一些 android 逻辑?
      },
      child: new HycTabBarWidget(
//        TODO: 还没配置抽屉
        type: HycTabBarWidget.BOTTOM_BAR,
        tabItems: tabs,
        tabViews: <Widget>[
          new DynamicPage(),
          new RankPage(),
          new MePage()
        ],
        backgroundColor: HycColors.primarySwatch,
        indicatorColor: Color(HycColors.white),
        title: HycTitleBar(
          title: "Github",
          iconData: HycIcons.MAIN_SEARCH,
          needRightLocalIcon: true,
          onPressed: () {
            print("goToSearch");
          },
        ),
      ),
    );
  }
}

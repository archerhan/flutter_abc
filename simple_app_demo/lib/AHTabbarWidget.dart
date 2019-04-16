import 'package:flutter/material.dart';

class AHTabbar extends StatefulWidget {
  static const int BOTTOM_TAB = 1;
  static const int TOP_TAB = 2;
  final int type;
  final List<Widget> tabItems;
  final List<Widget> tableViews;
  final Color backgroundColor;
  final Color indicatorColor;
  final Widget title;
  final Widget drawer;
  final Widget floatingActionButton;
  final TarWidgetControl tarWidgetControl;
  final PageController topPageContrl;
  final Text test;

  AHTabbar({
    Key key,
    this.type,
    this.tabItems,
    this.tableViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.topPageContrl,
  }) : super(key : key);

  @override
  _AHTabbarState createState() => new _AHTabbarState(type,tabItems,tableViews,backgroundColor,indicatorColor,title,drawer,floatingActionButton,tarWidgetControl,topPageContrl);
}
///这是个有状态的 widget,所以先配置状态
class _AHTabbarState extends State<AHTabbar> with SingleTickerProviderStateMixin {
  ///变量定义在这里
  final int _type;
  final List<Widget> _tabItems;
  final List<Widget> _tableViews;
  final Color _backgroundColor;
  final Color _indicatorColor;
  final Widget _title;
  final Widget _drawer;
  final Widget _floatingActionButton;
  final PageController _pageController;

  _AHTabbarState(
      this._type,
      this._tabItems,
      this._tableViews,
      this._backgroundColor,
      this._indicatorColor,
      this._title,
      this._drawer,
      this._floatingActionButton,
      this._pageController
      ) : super();
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    ///初始化创建控制器
    ///通过 with SingleTickerProviderStateMixin 实现动画效果
    _tabController = TabController(length: _tabItems.length, vsync: this);
  }

  @override
  void dispose () {
    ///页面销毁时控制器销毁
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///顶部 Tabbar 样式
    if (this._type == AHTabbar.TOP_TAB) {
      return new Scaffold(
        //设置侧边滑出 drawer
        drawer: _drawer,
        //设置悬浮按钮
        floatingActionButton: _floatingActionButton,
        ///标题栏
        appBar: new AppBar(
          backgroundColor: _backgroundColor,
          title: _title,
          ///tabbar控件
          bottom: new TabBar(
            tabs: _tabItems,
            isScrollable: true,
            controller: _tabController,
            indicator: _indicatorColor,
          ),
        ),
        ///页面主体
        body: new PageView(
          ///必须有的控制器,与 tabbar 同步
          controller: _pageController,
          ///每一个 tab对应的页面主体, 第一个List<Widget>
          children: _tableViews,
          ///页面滑动回调, 同步切换选中状态
          onPageChanged: (index){
            _tabController.animateTo(index);
          },
        ),
      );
    }
    ///底部 tabbar 样式
    return new Scaffold(
      drawer: _drawer,
      floatingActionButton: _floatingActionButton,
      appBar: new AppBar(
        backgroundColor: _backgroundColor,
        title: _title,
      ),
      body: new PageView(
        controller: _pageController,
        children: _tableViews,
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
      ///底部导航栏,也就是tab 栏
      bottomNavigationBar: new Material(
        color: _backgroundColor,
        child: new TabBar(
          tabs: _tabItems,
          indicatorColor: _indicatorColor,
        ),
      ),
    );
  };
}

class TarWidgetControl  {
  List<Widget> footerButton = [];
}

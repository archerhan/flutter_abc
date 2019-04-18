/**
 * @author Archer
 * @date 2019-04-18
 * Description: 自定义顶部或底部 TabBar 控件
 */
import 'package:flutter/material.dart';

class HycTabBarWidget extends StatefulWidget {
  ///定义两个类型,顶部和底部
  static const int BOTTOM_BAR = 1;
  static const int TOP_BAR = 2;

  final int type;
  final List<Widget> tabItems;
  final List<Widget> tabViews;
  final Color backgroundColor;
  final Color indicatorColor;
  final Widget title;
  final Widget drawer;
  final Widget floatingActionButton;
  final TarWidgetControl tarWidgetControl;
  final ValueChanged<int> onPageChanged;

  HycTabBarWidget({
    Key key,
    this.type,
    this.tabItems,
    this.tabViews,
    this.backgroundColor,
    this.indicatorColor,
    this.title,
    this.drawer,
    this.floatingActionButton,
    this.tarWidgetControl,
    this.onPageChanged}) : super(key: key);


  @override
  _HycTabBarWidgetState createState() => _HycTabBarWidgetState(
    type,
    tabViews,
    indicatorColor,
    title,
    drawer,
    floatingActionButton,
    tarWidgetControl,
    onPageChanged,
  );
}

class _HycTabBarWidgetState extends State<HycTabBarWidget> with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabViews;

  final Color _indicatorColor;

  final Widget _title;

  final Widget _drawer;

  final Widget _floatingActionButton;

  final TarWidgetControl _tarWidgetControl;

  final PageController _pageController = PageController();

  final ValueChanged<int> _onPageChanged;

  _HycTabBarWidgetState(
      this._type,
      this._tabViews,
      this._indicatorColor,
      this._title,
      this._drawer,
      this._floatingActionButton,
      this._tarWidgetControl,
      this._onPageChanged) : super();
  TabController _tabController;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (this._type == HycTabBarWidget.TOP_BAR) {
      return new Scaffold(
        floatingActionButton: _floatingActionButton,
        persistentFooterButtons: _tarWidgetControl == null ? [] : _tarWidgetControl.footerButton,
        appBar: new AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: _title,
          bottom: new TabBar(
            controller: _tabController,
            tabs: widget.tabItems,
            indicatorColor: _indicatorColor,
            onTap: (index){
                _onPageChanged?.call(index);
                _pageController.jumpTo(MediaQuery.of(context).size.width * index);
                }),
        ),
        body: new PageView(
          controller: _pageController,
          children: _tabViews,
          onPageChanged: (index){
            _tabController.animateTo(index);
            _onPageChanged?.call(index);
          },
        ),
      );
    }

    return new Scaffold(
      drawer: _drawer,
      appBar: new AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      body: new PageView(
        controller: _pageController,
        children: _tabViews,
        onPageChanged: (index){
          _tabController.animateTo(index);
          _onPageChanged?.call(index);
        },
      ),
      bottomNavigationBar: new Material(
        color: Theme.of(context).primaryColor,
        child: new TabBar(
          tabs: widget.tabItems,
          controller: _tabController,
          indicatorColor: _indicatorColor,
          onTap: (index){
            _onPageChanged?.call(index);
            _pageController.jumpTo(MediaQuery.of(context).size.width * index);
          },
        ),
      ),
    );

  }
}

class TarWidgetControl {
  List<Widget> footerButton = [];
}



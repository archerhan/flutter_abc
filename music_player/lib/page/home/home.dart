/**
 * @author Archer
 * @date 2019-04-29
 * Description:
 */
import 'package:flutter/material.dart';
import 'package:music_player/page/home/personal_playlist.dart';
import 'package:music_player/page/home/cloud_music.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {

  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProxyAnimation transitionAnimation = ProxyAnimation(kAlwaysDismissedAnimation);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(

        ),
        appBar: AppBar(
          leading: IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_arrow,
                color: Theme.of(context).primaryIconTheme.color,
                progress: transitionAnimation,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              }),
          title: Container(
            height: kToolbarHeight,
            width: 128,
            child: TabBar(
              controller: _tabController,
              indicator:
              UnderlineTabIndicator(insets: EdgeInsets.only(bottom: 4)),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(child: Icon(Icons.music_note)),
                Tab(child: Icon(Icons.cloud)),
              ],
            ),
          ),
          titleSpacing: 0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //TODO:搜索页面
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
//TODO:body 未做, 带有播放功能
      ),
    );
  }
}
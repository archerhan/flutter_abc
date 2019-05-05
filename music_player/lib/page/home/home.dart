/**
 * @author Archer
 * @date 2019-04-29
 * Description:
 */

import 'package:flutter/material.dart';
import 'package:music_player/page/home/personal_playlist.dart';
import 'package:music_player/page/home/cloud_music.dart';
import 'package:music_player/common/model/account.dart';


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
					child: Column(
						children: <Widget>[
							_AppDrawerHeader(),
							MediaQuery.removePadding(
								context: context,
								removeTop: true,
								child: Expanded(
									child: ListTileTheme(
										style: ListTileStyle.drawer,
										child: ListView(
											children: <Widget>[
												ListTile(
													leading: Icon(Icons.settings),
													title: Text('设置'),
													onTap: () {
//														Navigator.pushNamed(context, ROUTE_SETTING);
													},
												),
												Divider(height: 0, indent: 16),
												ListTile(
													leading: Icon(Icons.format_quote),
													title: Text('Start at github'),
													onTap: () {
														debugPrint('跳转 github');
													},
												)
											],
										),
									),
								),
							),
						],
					),
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

//drawer
class _AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    if (UserAccount.of(context).isLogin) {
//			return _buildHeader(context);
//    }
//    else {
    	return _buildHeaderNotLogin(context);
//		}
  }

  Widget _buildHeader(BuildContext context) {
//  	Map profile = UserAccount.of(context).user['profile'];
  	return UserAccountsDrawerHeader(
			currentAccountPicture: InkResponse(
				onTap: () {
					if (UserAccount.of(context).isLogin) {
						debugPrint("work in process...");
					}
				},
				child: CircleAvatar(
					backgroundColor: Colors.blue,
				),
			),
			accountName: Text('nickname'),
			accountEmail: null,
			otherAccountsPictures: <Widget>[
				Material(
					color: Colors.transparent,
					child: IconButton(
						icon: Icon(
							Icons.exit_to_app,
							color: Theme.of(context).primaryIconTheme.color,
						),
						tooltip: "退出登录",
						onPressed: () async {
							//TODO:对话框未做
							debugPrint("退出登录---对话框");
							UserAccount.of(context, rebuildOnChange: false).logout();
						},
					),

				)

			],

		);
	}

	Widget _buildHeaderNotLogin(BuildContext context) {
  	return DrawerHeader(
			decoration: BoxDecoration(
				color: Theme.of(context).primaryColorDark
			),
			child: Container(
				constraints: BoxConstraints.expand(),
				child: DefaultTextStyle(
					style: Theme.of(context).primaryTextTheme.caption.copyWith(fontSize: 14),
					child: Center(
						child: Column(
							mainAxisSize: MainAxisSize.min,
							children: <Widget>[
								Text('登录网易云音乐'),
								Text('手机电脑多端同步,尽享海量高品质音乐'),
								SizedBox(height: 8),
								FlatButton(
									shape: RoundedRectangleBorder(
										side: BorderSide(
											color: Theme.of(context).primaryTextTheme.body1.color.withOpacity(0.3)),
										borderRadius: BorderRadius.circular(20)),
									padding: EdgeInsets.symmetric(horizontal: 40),
									onPressed: () {
//										Navigator.pushNamed(context, ROUT_LOGIN);
									},
									textColor: Theme.of(context).primaryTextTheme.body1.color,
									child: Text('立即登录'),
								),
							],
						),
					),
				),
			),
		);
	}
}

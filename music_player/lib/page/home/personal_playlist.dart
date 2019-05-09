/**
 * @author Archer
 * @date 2019-04-29
 * Description: 个人播放列表,首页
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/widget/refresh_indicator.dart';
import 'package:music_player/common/network/network_manager.dart';
import 'package:music_player/common/model/account.dart';
import 'package:music_player/common/counter.dart';
import 'package:music_player/common/network/local_data.dart';
import 'package:music_player/widget/dividers.dart';

class MainPlayListPage extends StatefulWidget {
  @override
  _MainPlayListPageState createState() => _MainPlayListPageState();
}

class _MainPlayListPageState extends State<MainPlayListPage> with AutomaticKeepAliveClientMixin {

  GlobalKey<RefreshIndicatorState> _indicatorKey = GlobalKey();
  GlobalKey<LoaderState> _loaderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: '点击相加',
        child: Icon(Icons.add,color: Colors.white,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("这是界面"),
          ],
        ),
      ),
    );
    
//  	return ListView(
//      children: <Widget>[_PinnedHeader()],
//    );

//    final userId = UserAccount.of(context).userId;
//    Widget widget;
//    if (!UserAccount.of(context).isLogin) {
//      //TODO:显示登录条
//    }
//    else {
//      widget = RefreshIndicator(
//        key:_indicatorKey,
//        onRefresh: () => Future.wait([
//          _loaderKey.currentState.refresh(),
//          Counter.refresh(context),
//        ]),
//        child: Loader(
//          key: _loaderKey,
//          initialData: neteaseLocalData.getUserPlaylist(userId),
//          loadTask: () => neteaseRepository.userPlaylist(userId),
//          resultVerify: simpleLoaderResultVerify((v) => v != null),
//          loadingBuilder: (context) {
//            _indicatorKey.currentState.show();
//            return ListView(
//              children: <Widget>[
//                //TODO:Pinted header
//              ],
//            );
//          },
//          failedWidgetBuilder: (context, result, msg) {
//
//          },
//        ),
//
//      );
//    }
//    return Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}

class _PinnedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        UserAccount.of(context).isLogin
            ? null
            : DividerWrapper(
          child: ListTile(
              title: Text("当前未登录，点击登录!"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, "/login");
              }),
        ),
        DividerWrapper(
            indent: 16,
            child: ListTile(
              leading: Icon(
                Icons.schedule,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('播放记录'),
              onTap: () {

//                if (UserAccount.of(context, rebuildOnChange: false).isLogin) {
//                  Navigator.push(context, MaterialPageRoute(builder: (context) {
//                    return RecordPage(
//                        uid: UserAccount.of(context, rebuildOnChange: false)
//                            .userId);
//                  }));
//                } else {
//                  //todo show login dialog
//                }
              },
            )),
        DividerWrapper(
            indent: 16,
            child: ListTile(
              leading: Icon(
                Icons.cast,
                color: Theme.of(context).primaryColor,
              ),
              title: Text.rich(TextSpan(children: [
                TextSpan(text: '我的电台 '),
                TextSpan(
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                    text:
                    '(${Counter.of(context).djRadioCount + Counter.of(context).createDjRadioCount})'),
              ])),
              onTap: () {
//                Navigator.pushNamed(context, ROUTE_MY_DJ);
              },
            )),
        ListTile(
          leading: Icon(
            Icons.library_music,
            color: Theme.of(context).primaryColor,
          ),
          title: Text.rich(TextSpan(children: [
            TextSpan(text: '我的收藏 '),
            TextSpan(
                style: const TextStyle(fontSize: 13, color: Colors.grey),
                text:
                '(${Counter.of(context).mvCount + Counter.of(context).artistCount})'),
          ])),
          onTap: () {
//            Navigator.pushNamed(context, ROUTE_MY_COLLECTION);
          },
        ),
        Container(height: 8, color: Color(0xfff5f5f5))
      ]..removeWhere((v) => v == null),
    );
  }
}
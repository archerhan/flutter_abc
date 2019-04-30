/**
 * @author Archer
 * @date 2019-04-29
 * Description: 个人播放列表,首页
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/widget/refresh_indicator.dart';

class MainPlayListPage extends StatefulWidget {
  @override
  _MainPlayListPageState createState() => _MainPlayListPageState();
}

class _MainPlayListPageState extends State<MainPlayListPage> with AutomaticKeepAliveClientMixin {

  GlobalKey<RefreshIndicatorState> _indicatorKey = GlobalKey();
  GlobalKey<LoaderState> _loaderKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => null;
}

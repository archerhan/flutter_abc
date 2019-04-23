import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:github_copy/common/redux/hyc_state.dart';

import 'package:github_copy/common/model/user.dart';


void main() => runApp(FlutterReduxApp());

class FlutterReduxApp extends StatelessWidget {

  final store = new Store<HycState>(
    appReducer,
    middleware: middleware,
//    TODO:CommonUtils 类待完善
//    initialState: new HycState(userInfo: User.empty(),themeData: )
  );
  FlutterReduxApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
    );
  }
}


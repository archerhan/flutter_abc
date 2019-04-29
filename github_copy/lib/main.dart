import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:github_copy/common/localization/default_localizations.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:github_copy/common/redux/hyc_state.dart';
import 'package:github_copy/common/style/hyc_style.dart';
import 'package:github_copy/common/model/user.dart';
import 'package:github_copy/common/localization/hyc_localizations_delegate.dart';

import 'package:github_copy/page/home_page.dart';


void main() => runApp(FlutterReduxApp());

class FlutterReduxApp extends StatelessWidget {

  final store = new Store<HycState>(
    appReducer,
    middleware: middleware,
//    TODO:CommonUtils 类待完善
    initialState: new HycState(userInfo: User.empty(),themeData: ThemeData(primarySwatch: HycColors.primarySwatch), locale: Locale('zh' , 'CH')),
  );
  FlutterReduxApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<HycState>(builder: (context, store){
        return new MaterialApp(
//          localizationsDelegates: [
//            GlobalMaterialLocalizations.delegate,
//            GlobalWidgetsLocalizations.delegate,
//            HycLocalizationsDelegate.delegate,
//          ],
//          locale: store.state.locale,
//          supportedLocales: [store.state.locale],
          theme: store.state.themeData,
          routes: {
            HomePage.sName : (context) {
              return new HomePage();
            },
          },
        );
      }),
    );
  }
}

class HycLocalizations extends StatefulWidget {
  final Widget child;
  HycLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<HycLocalizations> createState() {
    return new _HycLocalizations();
  }
}

class _HycLocalizations extends State<HycLocalizations> {
  StreamSubscription stream;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<HycState>(builder: (context, store) {
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }

  @override
  void initState() {
    super.initState();
  //TODO:网络请求错误码
  }

  @override
  void dispose() {
    super.dispose();
    if (stream != null) {
      stream.cancel();
      stream = null;
    }
  }
  errorHandleFuction(int code, message) {
    //TODO:根据错误码给出对应提示
  }
}


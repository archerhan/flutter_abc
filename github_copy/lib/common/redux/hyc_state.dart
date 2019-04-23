/**
 * @author Archer
 * @date 2019-04-23
 * Description: Redux 全局 State
 */
import 'package:flutter/material.dart';
import 'package:github_copy/common/redux/user_redux.dart';
import 'package:github_copy/common/redux/locale_redux.dart';
import 'package:github_copy/common/redux/theme_redux.dart';
import 'package:github_copy/common/model/user.dart';
import 'package:github_copy/common/redux/middleware/epic_middleware.dart';
import 'package:redux/redux.dart';

class HycState {
  ///用户信息
  User userInfo;
  ///主题数据
  ThemeData themeData;
  ///语言
  Locale locale;
  ///当前平台手机默认语言
  Locale platformLocale;

  ///构造方法
  HycState({this.userInfo,this.themeData,this.locale});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store

HycState appReducer(HycState state, action) {
  return HycState(
    userInfo: UserReducer(state.userInfo, action),
    themeData: ThemeDataReducer(state.themeData, action),
    locale: LocaleReducer(state.locale, action)

  );
}
final List<Middleware<HycState>> middleware = [
  EpicMiddleware<HycState>(UserInfoEpic()),
  UserInfoMiddleware(),
];

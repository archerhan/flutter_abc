/**
 * @author Archer
 * @date 2019-04-23
 * Description: 事件 Redux
 */
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

///通过 flutter_redux 的combineReducers,实现Reducer 方法
final ThemeDataReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

///定义处理Action行为的方法,返回新的 State
ThemeData _refresh(ThemeData themeData, action) {
  ///将 Action,处理 Action的方法, State绑定
  themeData = action.themeData;
  return themeData;
}

///定义一个 Action 类
///将该 Aciton 在 reducer 中与处理该 Action 的方法绑定
class RefreshThemeDataAction {
  final ThemeData themeData;
  RefreshThemeDataAction(this.themeData);
}
/**
 * @author Archer
 * @date 2019-04-23
 * Description: 语言 Redux
 */
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final LocaleReducer = combineReducers<Locale>([
  TypedReducer<Locale, RefreshLocalAction>(_refresh),
]);

Locale _refresh(Locale local, RefreshLocalAction action){
  local = action.locale;
  return local;
}

class RefreshLocalAction {
  final Locale locale;
  RefreshLocalAction(this.locale);
}
/**
 * @author Archer
 * @date 2019-04-23
 * Description: 用户相关 Redux
 */
import 'package:flutter/material.dart';
import 'package:github_copy/common/model/user.dart';
import 'package:github_copy/common/redux/hyc_state.dart';
import 'package:github_copy/common/redux/middleware/epic_store.dart';
import 'package:github_copy/common/redux/middleware/epic.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

final UserReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);

///如果有 UserUpdateAction发起一个请求时
///就会调用到_updateLoaded
///_updateLoaded 这里接受一个新的 userInfo,并返回
User _updateLoaded(User user, action) {
  user = action.userInfo;
  return user;
}
///定义一个 UserUpdateAction,用于发起 userInfo的改变
///类名随意, 需要通过上面的TypedReducer绑定
class UpdateUserAction {
  final User userInfo;
  UpdateUserAction(this.userInfo);
}

class FetchUserAction {

}

class UserInfoMiddleware implements MiddlewareClass<HycState>{
  @override
  void call(Store<HycState> store, dynamic action, NextDispatcher next) {
    if(action is UpdateUserAction) {
      print("**********UserInfoMiddleware************");
    }
    next(action);
  }
}

class UserInfoEpic implements EpicClass<HycState> {
  @override
  Stream call(Stream actions, EpicStore<HycState> store) {
    return Observable(actions)
        .ofType(TypeToken<FetchUserAction>())
        .debounce(new Duration(milliseconds: 10))
        .switchMap((action) => _loadUserInfo());

  }
  Stream<dynamic> _loadUserInfo() async* {
    print("************ userInfoEpic _loadUserInfo *************");
    //TODO:UserDao
    var res = null;
    yield UpdateUserAction(res.data);
  }
}

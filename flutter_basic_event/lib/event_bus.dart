/**
 *  author : archer
 *  date : 2019-06-11 14:43
 *  description :
 */

import "package:flutter/material.dart";

typedef void EventCallBack(arg);

class EventBus {

  //私有构造函数
  EventBus._internal();
  //保存单例
  static EventBus _singleton = EventBus._internal();
  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列,key:事件名(id), value:对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallBack>>();

  //添加订阅者
  void on(eventName, EventCallBack f){
    if (eventName == null || f == null)return;
    _emap[eventName] ??= new List<EventCallBack>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallBack f]){
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    }
    else {
      list.remove(f);
    }
  }

  //触发事件,事件触发后,该事件的所有订阅者将会被调用
  void emit(eventName, [arg]){
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历,防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1 ;--i) {
      list[i](arg);
    }
  }

  //定义一个top-level变量，页面引入该文件后可以直接使用bus
  var bus =  new EventBus();
}
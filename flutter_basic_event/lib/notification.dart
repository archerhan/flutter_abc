/**
 *  author : archer
 *  date : 2019-06-11 15:42
 *  description :
 */

import "package:flutter/material.dart";

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg = notification.msg + "  ";
          });
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //这部分的按钮不会起作用
//              RaisedButton(
//                onPressed: () {
//                  MyNotification("Hi").dispatch(context);
//                },
//                child: Text("Send Notification"),
//              ),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () {
                      MyNotification("Hi").dispatch(context);
                    },
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

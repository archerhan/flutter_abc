/**
 *  author : archer
 *  date : 2019-06-11 10:39
 *  description :
 */

import "package:flutter/material.dart";
import 'package:flutter_basic_event/event_bus.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {

  String _operation = "No gesture detected";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gesture demo"),),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation,style: TextStyle(color: Colors.white),),
          ),
          onTap: () => updateText("Tap"),
          onDoubleTap: () => updateText("Double tap"),
          onLongPress: () {
            String userinfo = "666";
            EventBus().emit("name", userinfo);
          },
//          onLongPress: () => updateText("Long press"),
        ),
      ),
    );
  }
  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}


class ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {

  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Image.asset("./images/valley.jpg",width: _width,),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200*details.scale.clamp(0.5, 3.9);
            });
          },
        ),
      ),
    );
  }
}



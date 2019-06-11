/**
 *  author : archer
 *  date : 2019-06-11 11:04
 *  description :
 */

import "package:flutter/material.dart";
import 'package:flutter_basic_event/event_bus.dart';

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {

  double _top = 0.0;
  double _left = 0.0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    EventBus().on("name", (arg){
      print(arg);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drag demo"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("A"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },

//              onPanDown: (DragDownDetails e){
//                print("用户手指按下：${e.globalPosition}");
//              },
//              onPanUpdate: (DragUpdateDetails e) {
//                setState(() {
//                  _left += e.delta.dx;
//                  _top += e.delta.dy;
//                });
//              },
//              onPanEnd: (DragEndDetails e) {
//                print(e.velocity);
//
//              },
            ),
          )
        ],
      ),
    );
  }
}

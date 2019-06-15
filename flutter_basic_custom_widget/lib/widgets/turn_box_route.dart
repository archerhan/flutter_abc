/**
 *  author : archer
 *  date : 2019-06-15 15:00
 *  description :
 */

import 'package:flutter/material.dart';
import '../widgets/turn_box.dart';

class TurnBoxRoute extends StatefulWidget {
  @override
  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {

  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Turn box demo"),),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh,size:50.0),
            ),
            TurnBox(
              turns: _turns,
              speed: 100,
              child: Icon(Icons.refresh,size:100.0),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  _turns += 0.2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针旋转1/5圈"),
              onPressed: (){
                setState(() {
                  _turns -= 0.2;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

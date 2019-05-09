/**
 * @author Archer
 * @date 2019-04-29
 * Description:
 */
import 'package:flutter/material.dart';

class MainCloudPage extends StatefulWidget {
  @override
  _MainCloudPageState createState() => _MainCloudPageState();
}

class _MainCloudPageState extends State<MainCloudPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: '点击相加',
          child: Icon(Icons.add,color: Colors.white,),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("这是界面"),
            ],
          ),
        ),
    );
  }
}


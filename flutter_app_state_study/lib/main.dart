import 'package:flutter/material.dart';
import 'demo_page.dart';

void main () {
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  DemoApp({Key key}) : super(key: key );
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: DemoPage());
  }
}

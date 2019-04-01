import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  //Widget 子类中的字段往往会定义为'final'
  final Widget title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0,//单位是逻辑上的像素(并非真实的像素)
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation Menu',
              onPressed: null//null会禁用 button
          ),
          new Expanded(
              child: title
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null)
        ],
      ),
    );

  }

}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new MyAppBar(
          title: new Text(
            'Example Title',
            style: Theme.of(context).primaryTextTheme.title,
          ),
        ),
        new Expanded(
            child: new Center(
              child: new Text('Hello world!'),
        ))
      ],
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'My App',
      home: new MyScaffold(),
    )
  );
}
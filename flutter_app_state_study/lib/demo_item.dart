import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget {

  DemoItem() : super();
  /*私有方法
  * */
  _getBottomItem(IconData icon, String text) {
    return new Expanded(
    flex: 1,
    child: new Center(//居中
      child: new Row(//横向布局
        mainAxisAlignment: MainAxisAlignment.start,//主轴居中,即横向居中
        mainAxisSize: MainAxisSize.max,//大小按照最大充满
        crossAxisAlignment: CrossAxisAlignment.center,//竖向也居中
        children: <Widget>[
          new Icon(//小星星
            icon,
            size: 16.0,
            color: Colors.grey,
          ),
          //间隔
          new Padding(padding: new EdgeInsets.all(5.0)),
          new Container(
            width: 60,
            child:
            new Text (
              text,
              style: TextStyle(color: Colors.grey, fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return  new Container(
      ///卡片包装
      child: new Card(
        child: new FlatButton(
            onPressed: (){print("点击了哦");},
            child: new Padding(
              padding: new EdgeInsets.only(left: 0.0,top: 10.0,right: 10.0, bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ///文本描述
                  new Container(
                    child: new Text(
                      "这是一点描述",
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 14.0,
                      ),
                      ///最长三行,超过以...表示
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6.0,bottom: 2.0),
                    alignment: Alignment.topLeft,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  ///三个横向平均分配的图标文字
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "98765432"),
                      _getBottomItem(Icons.link, "1234"),
                      _getBottomItem(Icons.subject, "67077")

                    ],
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}


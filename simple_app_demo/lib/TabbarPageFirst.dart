import 'package:flutter/material.dart';

class TabbarPageFirst extends StatefulWidget {
  @override
  _TabbarPageFirstState createState() => _TabbarPageFirstState();
}
//AutomaticKeepAliveClientMixin 你会发现页面点击切换时，StatefulWidget 的子页面每次都会重新调用initState。这肯定不是我们想要的，
// 所以这时你就需要AutomaticKeepAliveClientMixin 。
class _TabbarPageFirstState extends State<TabbarPageFirst> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }
  generateWordPairs() {
    return [
      "111",
      "222",
      "333",
      "444",
      "555",
      "666",
      "777",
      "888",
      "999",
      "000",
      "xxx",
      "uuu"
    ];
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs());
          }
          return _buildRow(_suggestions[index]);
        });
  }
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildSuggestions();
  }
}

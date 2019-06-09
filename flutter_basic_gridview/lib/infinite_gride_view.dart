import 'package:flutter/material.dart';

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveIcons();
  }
  _retrieveIcons(){
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll(
          [          Icons.ac_unit,
            Icons.airport_shuttle,
            Icons.all_inclusive,
            Icons.beach_access, Icons.cake,
            Icons.free_breakfast
          ]
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite grid view"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index){
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
      ),
    );
  }
}

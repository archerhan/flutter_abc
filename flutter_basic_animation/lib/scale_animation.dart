/**
 *  author : archer
 *  date : 2019-06-12 10:15
 *  description :
 */

import "package:flutter/material.dart";

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  //3秒播放了178帧,大概就是每秒60帧
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    );
    //Curve曲线的
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceIn,
    );
    animation = Tween(begin: 0.0,end: 300.0).animate(animation)
      ..addListener((){
        print(count);
        count++;
        setState(() {

        });
      });
    animation.addStatusListener((status){
      if (status == AnimationStatus.completed){
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: Image.asset("images/owl.jpg"),
      animation: animation,
    );
//    return AnimatedBuilder(
//      animation: animation,
//      child: Image.asset("images/owl.jpg"),
//      builder: (BuildContext context, Widget child){
//        return Scaffold(
//          body: Center(
//
//            child: Container(
//              height: animation.value,
//              width: animation.value,
//              child: child,
//            ),
//          ),
//        );
//      },
//    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}


class AnimatedImage extends AnimatedWidget {

  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset("images/owl.jpg",width: animation.value,height: animation.value,),
    );
  }
}


class GrowTransition extends StatelessWidget {

  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child){
            return new Container(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: child,
        ),
      ),
    );
  }
}




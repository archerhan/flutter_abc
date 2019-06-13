/**
 *  author : archer
 *  date : 2019-06-12 11:47
 *  description :
 */

import 'package:flutter/material.dart';
import 'package:flutter_basic_animation/hero_animate_route_b.dart';

class HeroAnimateRouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar",
            child: ClipOval(
              child: Image.asset("images/owl.jpg", width: 50.0,),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation, Animation secondeAnimation){
                return new FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(title: Text("原图"),),
                    body: HeroAnimatedRouteB(),
                  ),
                );
              }
            ));
          },
        ),
      ),
    );
  }
}

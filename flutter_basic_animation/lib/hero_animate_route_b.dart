/**
 *  author : archer
 *  date : 2019-06-12 11:47
 *  description :
 */
import "package:flutter/material.dart";

class HeroAnimatedRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "avatar",
          child: Image.asset("images/owl.jpg"),
        ),
      ),
    );
  }
}

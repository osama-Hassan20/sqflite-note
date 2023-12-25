import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.of(context).push(SliderRight(page: widget));

class SliderRight extends PageRouteBuilder {
  final page;
  SliderRight({required this.page})
      : super(
      pageBuilder: (context, animation, animationTwo) => page,
      transitionsBuilder: (context, animation, animationTwo, child){
        var begin = 0.0;
        var end = 1.0;
        var tween =Tween(begin: begin,end: end);
        var curvesAnimated = CurvedAnimation(parent: animation, curve: Curves.linear);
        return RotationTransition(turns: tween.animate(curvesAnimated),child: child,);
      }
  );
}
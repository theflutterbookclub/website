import 'package:flutter/material.dart';

Widget slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  Offset begin = Offset(1.0, 0.0);
  Offset end = Offset.zero;
  Curve curve = Curves.easeInOut;

  Animatable<Offset> tween = Tween<Offset>(
    begin: begin,
    end: end,
  ).chain(CurveTween(curve: curve));

  return SlideTransition(position: animation.drive(tween), child: child);
}

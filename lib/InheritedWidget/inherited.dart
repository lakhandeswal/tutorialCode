import 'package:flutter/material.dart';
import 'mycounter.dart';

class InheritedWid extends InheritedWidget {
  final MyCounter myCounter;
  final Widget child;

  InheritedWid({this.myCounter, this.child}) : super(child: child);

  static InheritedWid of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
  @override
  bool updateShouldNotify(InheritedWid oldWidget) {
    return myCounter != oldWidget.myCounter;
  }
}

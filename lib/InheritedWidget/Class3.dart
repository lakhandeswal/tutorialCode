import 'package:flutter/material.dart';
import 'inherited.dart';
import 'mycounter.dart';

class Class3 extends StatelessWidget {
  Class3();

  @override
  Widget build(BuildContext context) {
    MyCounter myCounter = InheritedWid.of(context).myCounter;

    return Container(
      child: Text(
        'Class 3: ${myCounter.counter}',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

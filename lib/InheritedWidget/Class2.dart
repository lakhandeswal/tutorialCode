import 'package:flutter/material.dart';
import 'Class3.dart';

class Class2 extends StatelessWidget {
  Class2();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('Class2'), Class3()],
      ),
    );
  }
}

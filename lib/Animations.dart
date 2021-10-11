import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  Animations({Key key}) : super(key: key);

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations>
    with SingleTickerProviderStateMixin {
  // if multiple tickers are required then use TickerProviderStateMixin
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Icon(
            Icons.circle,
            color: Colors.red,
            size: 20.0,
          ),
        ],
      ),
    );
  }
}

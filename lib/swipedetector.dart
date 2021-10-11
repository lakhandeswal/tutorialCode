import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class SwipeDetectorWid extends StatefulWidget {
  @override
  _SwipeDetectorWidState createState() => _SwipeDetectorWidState();
}

class _SwipeDetectorWidState extends State<SwipeDetectorWid> {
  double divideNo = 3;
  String directionName = 'SwipeDirection';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: MediaQuery.of(context).size.height,
      child: ListView(
      children:[
        MaterialButton(
            child: Text('$directionName',style: TextStyle(
              fontSize: 36.0
            ),),
            color: Colors.indigo,
            onPressed: (){
              Scaffold.of(context).openDrawer();
            }),
        Positioned(
        right: 0,
        left: 0,
        bottom: 0.0,
        child: SwipeDetector(
        onSwipeRight:(){
          setState(() {
          directionName= 'Right';
        });
        },
          onSwipeLeft: (){
          setState(() {
            directionName = 'Left';
          });
          },
          onSwipeDown: (){
          setState(() {
            directionName = 'Down';
          });
          },
          onSwipeUp: (){
          setState(() {
            directionName = 'Up';
          });
          },
        child: Padding(padding: EdgeInsets.only(top: 24.0,left: 8.0,right: 8.0), child:Container(
        height: 200.0,
        color: Colors.deepPurpleAccent
      ),),
    )
      )])
    );
  }
}

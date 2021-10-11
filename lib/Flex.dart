import 'package:flutter/material.dart';

class FlexWid extends StatefulWidget {
  @override
  _FlexWidState createState() => _FlexWidState();
}

class _FlexWidState extends State<FlexWid> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Container(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(flex:1,child: Container(color: Colors.red,)),
          Flexible(flex:4,child: Container(color: Colors.yellow,)),
          Flexible(flex:2,child: Container(color: Colors.green,)),
        ],
      ),
    ));
  }
}

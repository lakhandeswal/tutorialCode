import 'package:flutter/material.dart';

class ListWheel extends StatefulWidget {
  ListWheel({Key key}) : super(key: key);

  @override
  ListWheelState createState() => ListWheelState();
}

class ListWheelState extends State<ListWheel> {
  List itemList = [
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.amber,
    Colors.teal,
    Colors.deepOrange,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
        perspective: 0.006,
        diameterRatio: 3,
        itemExtent: MediaQuery.of(context).size.height * 0.2,
        //useMagnifier: true,
        magnification: 1.2,
        offAxisFraction: 1,
        children: itemList
            .map((e) => Card(
                  // height: MediaQuery.of(context).size.height * 0.2,
                  color: e,
                  child: Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text('Wheel scroll item')),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}

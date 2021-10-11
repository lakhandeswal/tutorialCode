import 'package:flutter/material.dart';

class LogicWid extends StatefulWidget {
  LogicWid({Key key}) : super(key: key);

  @override
  _LogicWidState createState() => _LogicWidState();
}

class _LogicWidState extends State<LogicWid> {
  List colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.cyanAccent,
    Colors.brown.shade500
  ];

  int counter = 0;
  bool maxTouch;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors[counter],
      child: Center(
          child: RawMaterialButton(
        fillColor: Colors.black,
        shape: StadiumBorder(),
        onPressed: () {
          print(counter);
          setState(() {
            if (counter < colors.length - 1 &&
                counter >= 0 &&
                maxTouch == false) {
              counter++;
            } else if (counter <= colors.length - 1 &&
                counter != 0 &&
                maxTouch == true) {
              counter--;
            } else if (counter == colors.length - 1) {
              maxTouch = true;
              counter--;
            } else if (counter == 0) {
              maxTouch = false;
              counter++;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Change BgColor $counter'),
        ),
      )),
    );
  }
}

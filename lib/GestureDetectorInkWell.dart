import 'package:flutter/material.dart';

class GestureInkWellWid extends StatefulWidget {
  GestureInkWellWid({Key key}) : super(key: key);

  @override
  _GestureInkWellWidState createState() => _GestureInkWellWidState();
}

class _GestureInkWellWidState extends State<GestureInkWellWid> {
  var nameTitle = 'LAKHAN DESWAL';
  var nameColor = Colors.orange[900];
  var nameSize = 18.0;
  var iconColor = Colors.white;
  var iconScale = 1.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (nameTitle == 'LAKHAN DESWAL') {
                        nameTitle = 'Lakhan deswal';
                        nameColor = Colors.cyan[400];
                        nameSize = 24.0;
                      } else if (nameTitle == 'Lakhan deswal') {
                        nameTitle = "LAKHAN DESWAL";
                        nameColor = Colors.orange[400];
                        nameSize = 18.0;
                      }
                    });
                  },
                  child: Text(
                    nameTitle,
                    style: TextStyle(color: nameColor, fontSize: nameSize),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (iconColor == Colors.white) {
                        iconColor = Colors.red[500];
                        iconScale = 1.5;
                      } else if (iconColor == Colors.red[500]) {
                        iconColor = Colors.white;
                        iconScale = 1.2;
                      }
                    });
                  },
                  child: Transform.scale(
                      scale: iconScale,
                      child: Icon(Icons.favorite, color: iconColor))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
              onTap: () {},
              child: Text(
                'www.instagram.com/lakhan_deswal',
                style: TextStyle(),
              )),
        )
      ]),
    );
  }
}

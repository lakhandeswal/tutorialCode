import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropFilterWid extends StatefulWidget {
  BackdropFilterWid({Key key}) : super(key: key);

  @override
  _BackdropFilterWidState createState() => _BackdropFilterWidState();
}

class _BackdropFilterWidState extends State<BackdropFilterWid> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.blueGrey[900]),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.pinkAccent.withOpacity(0.2),
                    width: MediaQuery.of(context).size.width - 40.0,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Backdrop Filter'),
                        Text(
                            'Backdrop filter widget is used to blur the background')
                      ],
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}

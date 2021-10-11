import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Opacity(
          opacity: 0.7,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.yellow, Colors.teal],
                      begin: Alignment.centerRight,
                      end: Alignment(-1.0, -1.0))))),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
          radius: 55.0,
          backgroundImage: AssetImage('images/ironmandark.jpg'),
        ),
        Text('Lakhan Deswal Tutorials',
            style: TextStyle(
                //color:Colors.white
                fontSize: 24.0))
      ])
    ]));
  }
}

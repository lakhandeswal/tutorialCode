import 'package:flutter/material.dart';
import 'Class2.dart';
import 'mycounter.dart';
import 'inherited.dart';

class Class1 extends StatefulWidget {
  Class1({Key key}) : super(key: key);

  @override
  _Class1State createState() => _Class1State();
}

class _Class1State extends State<Class1> {
  @override
  Widget build(BuildContext context) {
    MyCounter myCounter = InheritedWid.of(context).myCounter;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Class 1'),
          Class2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  color: Colors.amber[700],
                  child: Text('Inc. Count'),
                  onPressed: () {
                    setState(() {
                      myCounter.increaseCount();
                    });
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.red,
                  child: Text('Dec. Count'),
                  onPressed: () {
                    setState(() {
                      myCounter.decreaseCount();
                    });
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

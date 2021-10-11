import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AnimatedSpinkit extends StatefulWidget {
  AnimatedSpinkit({Key key}) : super(key: key);

  @override
  _AnimatedSpinkitState createState() => _AnimatedSpinkitState();
}

class _AnimatedSpinkitState extends State<AnimatedSpinkit> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      children: [
        SpinKitRotatingCircle(color: Colors.yellow),
        SpinKitChasingDots(color: Colors.green),
        SpinKitPulse(color: Colors.pinkAccent),
        SpinKitDoubleBounce(color: Colors.brown.shade400),
        SpinKitCircle(color: Colors.amber),
        SpinKitWave(color: Colors.blue, type: SpinKitWaveType.start),
        SpinKitWave(color: Colors.grey, type: SpinKitWaveType.center),
        SpinKitWave(color: Colors.pink, type: SpinKitWaveType.end),
        SpinKitThreeBounce(color: Colors.deepOrange),
        SpinKitFadingFour(color: Colors.indigo),
        SpinKitRing(color: Colors.white),
        SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: index.isEven ? Colors.red[900] : Colors.yellow),
            );
          },
        ),
        SpinKitSquareCircle(
          color: Colors.limeAccent,
          size: 50.0,
          // controller: AnimationController(
          //   vsync: this,
          //   duration:Duration(milliseconds: 1200)
          // ),
        )
      ],
    );
  }
}

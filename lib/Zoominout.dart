import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class Zoominout extends StatefulWidget {
  Zoominout({Key key}) : super(key: key);

  @override
  _ZoominoutState createState() => _ZoominoutState();
}

class _ZoominoutState extends State<Zoominout> {
  double scale = 1.0;
  double previousScale = 1.0;
  int rotatePos = 0;
  // RotatedBox's quarterTurns also accepts negative value

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: RaisedButton(
                onPressed: () {
                  print(rotatePos);
                  setState(() {
                    if (rotatePos < 4) {
                      rotatePos--;
                    } else {
                      rotatePos = 0;
                    }
                  });
                },
                child: Row(
                  children: [Text('Rotate Left'), Icon(Icons.rotate_left)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: RaisedButton(
                onPressed: () {
                  print(rotatePos);
                  setState(() {
                    if (rotatePos < 4) {
                      rotatePos++;
                    } else {
                      rotatePos = 0;
                    }
                  });
                },
                child: Row(
                  children: [Text('Rotate Right'), Icon(Icons.rotate_right)],
                ),
              ),
            )
          ],
        ),
        GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            print(details);
            previousScale = scale;
            setState(() {});
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            print(details);
            scale = previousScale * details.scale;
            setState(() {});
          },
          onScaleEnd: (ScaleEndDetails details) {
            previousScale = 1.0;
            setState(() {});
          },
          child: RotatedBox(
            quarterTurns: rotatePos,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.diagonal3(Vector3(scale, scale, scale)),
                child: Container(
                  height: 200,
                  child: Image(
                    image: AssetImage("images/ironmandark.jpg"),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

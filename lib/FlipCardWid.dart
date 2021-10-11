import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlipCardWid extends StatefulWidget {
  FlipCardWid({Key key}) : super(key: key);

  @override
  _FlipCardWidState createState() => _FlipCardWidState();
}

class _FlipCardWidState extends State<FlipCardWid> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.blueGrey, Colors.black26])),
        ),
        Container(
          child: FlipCard(
              front: Center(
                child: Material(
                  color: Colors.amber.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width - 60.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Transform.scale(
                              scale: 1.5,
                              child: Text(
                                'Lakhan Deswal',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Text('Click to know more about me')
                      ],
                    ),
                  ),
                ),
              ),
              back: Center(
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.red,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width - 60.0,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Lakhan Deswal'),
                          Text('Follow me on social Media'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebook,
                              ),
                              Text('www.facebook.com/LakhanDeswal'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.instagram),
                              Text('www.instagram.com/lakhandeswal'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.linkedin),
                              Text('www.linkedIn.com/lakhan_deswal'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.github),
                              Text('www.github.io/deswallakhan'),
                            ],
                          )
                        ]),
                  ),
                ),
              )),
        )
      ],
    );
  }
}

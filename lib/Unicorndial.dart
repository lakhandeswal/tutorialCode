import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter/src/rendering/box.dart';

class UnicorndialWid extends StatefulWidget {
  @override
  _UnicorndialWidState createState() => _UnicorndialWidState();
}

class _UnicorndialWidState extends State<UnicorndialWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Unicorndial'),
        ),
        body: Center(
            child: Text(
          'Unicordinal',
          style: TextStyle(fontSize: 30.0),
        )),
        // try using [try & catch] for rendering
        floatingActionButton: UnicornDialer(
          hasBackground: true,
          childPadding: 20.0,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(FontAwesomeIcons.shareAlt),
          parentButtonBackground: Colors.amber,
          childButtons: [
            UnicornButton(
              hasLabel: true,
              labelText: 'WhatsApp',
              currentButton: FloatingActionButton(
                onPressed: () {
                  print('whats app clicked');
                },
                backgroundColor: Colors.white,
                mini: true,
                child: Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: 'Facebook',
              currentButton: FloatingActionButton(
                onPressed: () {
                  print('Facebook clicked');
                },
                backgroundColor: Colors.white,
                mini: true,
                child: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: 'YouTube',
              currentButton: FloatingActionButton(
                onPressed: () {
                  print('YouTube clicked');
                },
                backgroundColor: Colors.white,
                mini: true,
                child: Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ));
  }
}

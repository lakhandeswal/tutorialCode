import 'package:flutter/material.dart';

class OverlayWid extends StatefulWidget {
  OverlayWid({Key key}) : super(key: key);

  @override
  _OverlayWidState createState() => _OverlayWidState();
}

class _OverlayWidState extends State<OverlayWid> {
  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          top: 90.0,
          right: 10.0,
          child: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 10.0,
            child: Text('1',
                style: TextStyle(
                  color: Colors.white,
                )),
          ));
    });

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Widget'),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showOverlay(context);
          },
          child: Text('Show Overlay'),
        ),
      ),
    );
  }
}

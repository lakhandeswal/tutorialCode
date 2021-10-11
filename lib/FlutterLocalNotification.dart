import 'package:flutter/material.dart';

class LocalNotif extends StatefulWidget {
  LocalNotif({Key key}) : super(key: key);

  @override
  _LocalNotifState createState() => _LocalNotifState();
}

class _LocalNotifState extends State<LocalNotif> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('local notification'),
    );
  }
}

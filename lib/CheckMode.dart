import 'package:flutter/material.dart';
import 'ModeCheck.dart';

class CheckMode extends StatefulWidget {
  @override
  _CheckModeState createState() => _CheckModeState();
}

class _CheckModeState extends State<CheckMode> {
  @override
  void initState() {
    super.initState();
    Util.checkDebugMode();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Text('${Util.mode} Mode'), Text('url : ${Util.url}')],
      ),
    );
  }
}

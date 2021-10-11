import 'package:flutter/material.dart';

class DropDownWid extends StatefulWidget {
  DropDownWid({Key key}) : super(key: key);

  @override
  _DropDownWidState createState() => _DropDownWidState();
}

class _DropDownWidState extends State<DropDownWid> {
  List dropDownItems = ['one', 'two', 'three', 'four', 'five'];
  var dropButtonVal = 'one';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            DropdownButton(
                value: dropButtonVal,
                items: dropDownItems
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (newSetValue) {
                  setState(() {
                    dropButtonVal = newSetValue;
                  });
                }),
            Text(dropButtonVal)
          ],
        ),
      ),
    );
  }
}

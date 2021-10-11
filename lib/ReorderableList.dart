import 'package:flutter/material.dart';

class ReorderableListWid extends StatefulWidget {
  ReorderableListWid({Key key}) : super(key: key);

  @override
  _ReorderableListWidState createState() => _ReorderableListWidState();
}

class _ReorderableListWidState extends State<ReorderableListWid> {
  List list = [
    '00',
    'a1',
    'b2',
    'c3',
    'd4',
    'e5',
    'f6',
    'g7',
    'h8',
    'i9',
    'j10'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReorderableListView(
          key: UniqueKey(),
          children: list
              .map((e) => ListTile(
                  key: ObjectKey(e),
                  leading: Icon(Icons.reorder_sharp),
                  title: Text(e)))
              .toList(),
          onReorder: _onReorder),
    );
  }

  _onReorder(oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex = newIndex - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }
}

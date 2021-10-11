import 'package:flutter/material.dart';

class CRUD extends StatefulWidget {
  CRUD({Key key}) : super(key: key);

  @override
  _CRUDState createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: items);
  }
}

List archive = [];

List<Widget> items = [
  DismissibleItemWid(
    title: 'Item 1',
  ),
  DismissibleItemWid(
    title: 'Item 2',
  ),
  Container(
    height: 100.0,
    //width: MediaQuery.of().size.width - 40.0,
    child: Column(
      children: [
        Divider(thickness: 0.5, color: Colors.white54),
        GestureDetector(
          child: Text('Archived'),
          onTap: () {},
        ),
        Divider(thickness: 0.5, color: Colors.white54),
      ],
    ),
  )
];

class DismissibleItemWid extends StatefulWidget {
  const DismissibleItemWid({Key key, this.title}) : super(key: key);

  final title;

  @override
  _DismissibleItemWidState createState() => _DismissibleItemWidState();
}

class _DismissibleItemWidState extends State<DismissibleItemWid> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('dismiss'),
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.delete), Icon(Icons.archive)],
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text(widget.title),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          setState(() {
            items.removeAt(0);
          });
          print(items.length);
        } else if (direction == DismissDirection.endToStart) {
          setState(() {
            items.removeAt(0);
            archive.add(items[0]);
          });
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class SliverAppBarWid extends StatefulWidget {
  SliverAppBarWid({Key key}) : super(key: key);

  @override
  _SliverAppBarWidState createState() => _SliverAppBarWidState();
}

class _SliverAppBarWidState extends State<SliverAppBarWid> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        leading: null,
        floating: true,
        snap: false,
// snap can only be set to true if floating is true, by setting this to true the appbar's flexibleSpace don't stuck in between fully opening and closing
        pinned: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('+ 28,754'),
        ),
        backgroundColor: Colors.grey[800],
        //title:Text('Zamana Transformed')
      ),
      SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) => ListTile(
              leading: Icon(
                Icons.play_arrow,
                size: 25.0,
              ),
              title: Text('Item ${index + 1}'))),
          itemExtent: 50.0),
    ]);
  }
}

import 'package:flutter/material.dart';

class OrientationGridView extends StatelessWidget {
  const OrientationGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          childAspectRatio: 4.5,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          padding: EdgeInsets.all(8.0),
          children: buildList());
    });
  }

  List<Widget> buildList() {
    return List.generate(
        6,
        (index) => GridTile(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    Text(
                      'Bookmark',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              // footer: ListTile(
              //   leading: Icon(
              //     Icons.circle,
              //     color: Colors.red.shade50,
              //     size: 24.0,
              //   ),
              //   title: Text('This is title'),
              //   subtitle: Text('uploaded 39 min ago'),
              //   trailing: Icon(Icons.more_vert),
              // ),
            ));
  }
}

import 'package:flutter/material.dart';

class SizePlacehldrVsblty extends StatefulWidget {
  SizePlacehldrVsblty({Key key}) : super(key: key);

  @override
  _SizePlacehldrVsbltyState createState() => _SizePlacehldrVsbltyState();
}

class _SizePlacehldrVsbltyState extends State<SizePlacehldrVsblty> {
  final GlobalKey _cardKey = GlobalKey();
  Size cardSize;
  Offset cardPosition;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPersistentFrameCallback((_) => _getSizeandPostion());
  }

  _getSizeandPostion() {
    RenderBox _cardBox = _cardKey.currentContext.findRenderObject();
    cardSize = _cardBox.size;
    cardPosition = _cardBox.localToGlobal(Offset.zero);
    print(cardSize);
    print(cardPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            key: _cardKey,
            child: Column(
              children: [
                FlatButton(
                    onPressed: () {
                      _getSizeandPostion();
                    },
                    child: Text('Size and position')),
                Text('Size- $cardSize'),
                Text('Position- $cardPosition')
              ],
            ),
          ),
        ),
        Placeholder(
          fallbackHeight: 100.0,
// width is not decreasing even after passing under container and constrained box
          fallbackWidth: 50.0,
          strokeWidth: 8.0,
          color: Colors.deepPurple,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Example of spacer and visibility'),
              ),
              Row(
                children: [
                  Text('Word 1'),
                  Spacer(
                    flex: 2,
                  ),
                  Visibility(
                      visible: false,
                      replacement: Text('Replaced Visible'),
                      child: Text('Word 2')),
                  Spacer(
                    flex: 1,
                  ),
                  Text('Word 3'),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    'Word 4',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}

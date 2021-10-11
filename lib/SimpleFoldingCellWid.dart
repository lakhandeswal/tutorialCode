import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class SimpleFoldingCellWid extends StatefulWidget {
  SimpleFoldingCellWid({Key key}) : super(key: key);

  @override
  _SimpleFoldingCellWidState createState() => _SimpleFoldingCellWidState();
}

class _SimpleFoldingCellWidState extends State<SimpleFoldingCellWid> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: SimpleFoldingCell(
            key: _foldingCellKey,
            frontWidget: Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: FlatButton(
                            onPressed: () {
                              return _foldingCellKey?.currentState
                                  ?.toggleFold();
                            },
                            child: Text('Open')),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    )
                  ],
                )),
            innerTopWidget: Container(
              color: Colors.indigo,
              //child: Text('Inner Top'),
            ),
            innerBottomWidget: Container(
              color: Colors.red,
              child: FlatButton(
                  onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                  child: Text('Close')),
              //child: Text('Inner Bottom'),
            ),
            cellSize: Size(MediaQuery.of(context).size.width, 175.0),
          ),
        ),
      ],
    );
  }
}

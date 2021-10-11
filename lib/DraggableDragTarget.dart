import 'dart:ui';
import 'package:flutter/material.dart';

class DraggableCont extends StatefulWidget {
  DraggableCont({Key key}) : super(key: key);

  @override
  _DraggableContState createState() => _DraggableContState();
}

class _DraggableContState extends State<DraggableCont> {
  Color caughtColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          DraggableWid(Offset(0.0, 0.0), Colors.deepOrange, 'Box one'),
          DraggableWid(Offset(0.0, 130.0), Colors.blue, 'Box two'),
          DraggableWid(Offset(0.0, 260.0), Colors.lime, 'Box three'),
          Positioned(
              left: 100.0,
              bottom: 0.0,
              child: DragTarget(onAccept: (Color color) {
                caughtColor = color;
              }, builder: (BuildContext context, List accepted, List rejected) {
                return Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: accepted.isEmpty
                          ? caughtColor
                          : Colors.grey.shade800),
                  child: Center(
                    child: Text(
                      'Drag Here',
                      style: TextStyle(
                          color: caughtColor == Colors.lime
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}

class DraggableWid extends StatefulWidget {
  DraggableWid(this.initPos, this.color, this.text);
  Offset initPos;
  Color color;
  String text;

  @override
  _DraggableStateWid createState() => _DraggableStateWid();
}

class _DraggableStateWid extends State<DraggableWid> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dx,
      left: position.dy,
      child: Draggable(
        data: widget.color,
        child: Container(
          height: 100.0,
          width: 100.0,
          color: widget.color,
          child: Text(widget.text),
        ),
        feedback: Container(
          height: 100.0,
          width: 100.0,
          color: widget.color,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 16.0),
            ),
          ),
        ),
        childWhenDragging: Container(
          height: 100.0,
          width: 100.0,
          color: widget.color.withOpacity(0.4),
          child: Text(widget.text),
        ),
        onDraggableCanceled: _onDraggableCanceled,
      ),
    );
  }

  _onDraggableCanceled(velocity, offset) {
    setState(() {
      position = offset;
    });
    print('${position.dx},${position.dy}');
  }
}

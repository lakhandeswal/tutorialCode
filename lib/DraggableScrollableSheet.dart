import 'package:flutter/material.dart';

class DraggableScrollableSheetWid extends StatefulWidget {
  DraggableScrollableSheetWid({Key key}) : super(key: key);

  @override
  _DraggableScrollableSheetWidState createState() =>
      _DraggableScrollableSheetWidState();
}

class _DraggableScrollableSheetWidState
    extends State<DraggableScrollableSheetWid> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.red.shade900),
        ),
        Positioned(
            child: DraggableScrollableSheet(
                maxChildSize: 1.0,
                minChildSize: 0.1,
                initialChildSize: 0.2,
                builder: (context, controller) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)),
                          child: Container(
                            color: Colors.purple,
                            child: ListView.builder(
                              controller: controller,
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('Item ${index + 1}'),
                                );
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40.0,
                              height: 4.0,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }))
      ],
    );
  }
}

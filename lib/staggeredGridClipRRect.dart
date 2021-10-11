import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class StaggeredGridViewWid extends StatefulWidget {
  StaggeredGridViewWid({Key key}) : super(key: key);

  @override
  _StaggeredGridViewWidState createState() => _StaggeredGridViewWidState();
}

class _StaggeredGridViewWidState extends State<StaggeredGridViewWid> {
  @override
  Widget build(BuildContext context) {
    double sliderVal = 1.0;

    return Scrollbar(
      thickness: 4.0,
      radius: Radius.circular(40.0),
      child: SingleChildScrollView(
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.all(10.0),
          children: [
            StaggeredItemz(
              title: '100% secure',
              icon: Icons.beenhere,
              color: Colors.brown,
            ),
            StaggeredItemz(
              title: 'Read Articles',
              icon: Icons.description,
              color: Colors.orange,
            ),
            StaggeredItemz(
              title: 'Listen Audio',
              icon: Icons.headset,
              color: Colors.pink,
            ),
            StaggeredItemz(
              title: 'Watch Videos',
              icon: Icons.videocam,
              color: Colors.red,
            ),
            FittedBox(
              child: StaggeredItemz(
                title: 'Chat with Creators',
                icon: Icons.chat,
                color: Colors.green,
              ),
            ),
            StaggeredItemz(
              title: 'Create & Earn Money',
              icon: Icons.attach_money,
              color: Colors.blue,
            ),
            StaggeredItemz(
              title: 'Join Us Now',
              icon: Icons.near_me_outlined,
              color: Colors.indigo,
            ),
            GridTile(
              child: Material(
                borderRadius: BorderRadius.circular(8.0),
                shadowColor: Colors.black,
                color: Colors.orange[900],
                elevation: 18.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(8.0),
                              child: Slider(
                                //key: GlobalKey(),
                                min: 0.0,
                                max: 5.0,
                                divisions: 5,
                                value: sliderVal,
                                label: sliderVal.toString(),
                                activeColor: Colors.red,
                                inactiveColor: Colors.white30,
                                onChanged: (newValue) {
                                  setState(() {
                                    sliderVal = newValue;
                                  });
                                  print(sliderVal);
                                },
                              )
                              // new Sparkline(
                              //   data: [0.0, 0.1, 0.2, 2.3, 1.6],
                              // )
                              ),
                          FlatButton(
                              color: Colors.lime,
                              onPressed: () {
                                // setState(() {
                                //   sliderVal = sliderVal + 1.0;
                                // });
                                print('sliderVal');
                              },
                              child: Text('Add')),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Circular Chart $sliderVal',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
            ClipRRectWid(
                alignside: Alignment.topLeft,
                icon: Icons.gamepad,
                iconbgcolor: Colors.red[900],
                hf: 1,
                wf: 1),
            ClipRRectWid(
                alignside: Alignment.topRight,
                icon: Icons.dashboard,
                iconbgcolor: Colors.lime[900],
                hf: 1,
                wf: 2),
            ClipRRectWid(
                alignside: Alignment.bottomLeft,
                icon: Icons.grid_on,
                iconbgcolor: Colors.yellow[900],
                hf: 2,
                wf: 2),
            ClipRRectWid(
                alignside: Alignment.bottomRight,
                icon: Icons.format_align_center,
                iconbgcolor: Colors.cyan[900],
                hf: 2,
                wf: 1),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 130.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(2, 120.0),
            StaggeredTile.extent(4, 180.0),
            StaggeredTile.extent(4, 130.0),
            StaggeredTile.extent(4, 130.0),
            StaggeredTile.extent(1, 70.0),
            StaggeredTile.extent(1, 70.0),
            StaggeredTile.extent(1, 70.0),
            StaggeredTile.extent(1, 70.0)
          ],
        ),
      ),
    );
  }
}

class ClipRRectWid extends StatelessWidget {
  const ClipRRectWid(
      {Key key, this.iconbgcolor, this.icon, this.alignside, this.hf, this.wf})
      : super(key: key);

  final iconbgcolor;
  final icon;
  final alignside;
  final double hf;
  final double wf;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.black,
        color: Colors.white,
        elevation: 18.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)),
              child: Align(
                alignment: alignside,
                heightFactor: hf,
                widthFactor: wf,
                child: Container(
                  color: iconbgcolor,
                  width: 60.0,
                  height: 50.0,
                  child: Icon(icon),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StaggeredItemz extends StatefulWidget {
  StaggeredItemz({Key key, this.title, this.icon, this.color})
      : super(key: key);
  final title;
  final icon;
  final color;

  @override
  _StaggeredItemzState createState() => _StaggeredItemzState();
}

class _StaggeredItemzState extends State<StaggeredItemz> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        shadowColor: Colors.black,
        color: widget.color[100],
        elevation: 18.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Material(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 45.0,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: widget.color),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}

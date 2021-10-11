import 'package:flutter/material.dart';

class BackdropWidget extends StatefulWidget {
  @override
  _BackdropWidgetState createState() => _BackdropWidgetState();
}

class _BackdropWidgetState extends State<BackdropWidget>  with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool get isPanelVisible{
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
          leading:IconButton(
            onPressed: (){
              print(controller.view);
              controller.fling(velocity: isPanelVisible ? -1.0: 1.0);
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: controller.view,
            ),
          ),
        title:Text('Backdrop')
      ),
      body: TwoPanels(
        controller:controller
      ),
    );
  }
}

class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  TwoPanels({this.controller});

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  static const header_height = 22.0;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints){
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    print('constraints : $constraints');
    return new RelativeRectTween(
      begin: RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, frontPanelHeight),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0)
    ).animate(CurvedAnimation(parent: widget.controller,curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            color: theme.primaryColor,
            child: new Center(
              child: new Text(
                "Back Panel",
                style: new TextStyle(fontSize: 24.0, color: Colors.white),
              ),
            ),
          ),
          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: new Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(16.0),
                  topRight: new Radius.circular(16.0)),
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Center(
                      child: new Text(
                        "Shop Here",
                        style: Theme.of(context).textTheme.button.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  new Expanded(
                    child: new Center(
                      child: new Text("Front Panel",
                          style: new TextStyle(
                              fontSize: 24.0, color: Colors.black)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: bothPanels,
    );
  }
}


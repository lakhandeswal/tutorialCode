import 'package:flutter/material.dart';
import 'package:tutorialscode/AnimatedLoaders.dart';
import 'package:tutorialscode/CustomCoursel.dart';
import 'package:tutorialscode/DraggableScrollableSheet.dart';
import 'package:tutorialscode/LazyListLoad.dart';
import 'package:tutorialscode/WebViewBrowser.dart';
import 'package:tutorialscode/Zoominout.dart';
import 'Backdrop.dart';
import 'ShaderMask.dart';
import 'sliverAppBar.dart';
import 'DismissibleList.dart';
import 'PageView.dart';
import 'SimpleFoldingCellWid.dart';
import 'DataTableHeroWid.dart';
import 'BackdropFilterWid.dart';
import 'Unicorndial.dart';
import 'GestureDetectorInkWell.dart';
import 'CRUD.dart';
import 'FlipCardWid.dart';
import 'HttpApi.dart';
import 'DropDownMenu.dart';
import 'ScoppedModel/ScopedModel.dart';
import 'OrientationGridView.dart';
import 'staggeredGridClipRRect.dart';
import 'clipPathClipper.dart';
import 'InheritedWidget/class1.dart';
import 'AnimatedCharts.dart';
import 'GooglePlayNestedTabs.dart';
import 'bottomNavBarCustom.dart';
import 'toastmessage.dart';
import 'Sizeplaceholdervisibility.dart';
import 'OverlayWidget.dart';
import 'WebSockets.dart';
import 'ReorderableList.dart';
import 'DraggableDragTarget.dart';
import 'DraggableScrollableSheet.dart';
import 'WebViewBrowser.dart';
import 'logicincrement.dart';
import 'Animations.dart';
import '3dlistview.dart';
import 'swipedetector.dart';
import 'emailauth.dart';
import 'GeneratedWidget.dart';
import 'CheckMode.dart';
import 'Flex.dart';
import 'incrementBloc.dart';
import 'ReorderableList.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Scrollbar(
          thickness: 4.0,
          radius: Radius.circular(40.0),
          child: ListView(children: [
            UserAccountsDrawerHeader(
              accountName: Text('Lakhan Deswal Tutorial'),
              accountEmail: Text('deswallakhan@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange.shade900,
                child: Text('L',
                    style: TextStyle(fontSize: 30.0, color: Colors.white)),
              ),
            ),
            DrawerListChild(
              listTileTitle: 'Logic Increment',
              appBarTitle: 'Logic Increment',
              returningWidget: LogicWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Custom Coursel',
              appBarTitle: 'Custom Coursel',
              returningWidget: CustomCoursel(),
            ),
            DrawerListChild(
              listTileTitle: 'Page View',
              appBarTitle: 'PageView',
              returningWidget: PageViewWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Lazy list Loading',
              appBarTitle: 'Lazy list Loading',
              returningWidget: LazyListLoad(),
            ),
            DrawerListChild(
              listTileTitle: 'Http api',
              appBarTitle: 'Http api',
              returningWidget: HttpApi(),
            ),
            DrawerListChild(
              listTileTitle: 'Check Mode',
              appBarTitle: 'Check Mode',
              returningWidget: CheckMode(),
            ),
            DrawerListChild(
              listTileTitle: 'Animations',
              appBarTitle: 'Animations',
              returningWidget: Animations(),
            ),
            DrawerListChild(
              listTileTitle: 'Flex Flexible',
              appBarTitle: 'Flex Flexible',
              returningWidget: FlexWid(),
            ),
            DrawerListChild(
              listTileTitle: 'WebView Browser',
              appBarTitle: 'WebView Browser',
              returningWidget: WebViewWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Bottom Nav Bar Custom',
              appBarTitle: 'Bottom Nav Bar Custom',
              returningWidget: BottomNavBarCustom(),
            ),
            DrawerListChild(
              listTileTitle: 'Staggered Grid View',
              appBarTitle: 'Staggered Grid View',
              returningWidget: StaggeredGridViewWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Orientation Grid View',
              appBarTitle: 'Orientation Grid View',
              returningWidget: OrientationGridView(),
            ),
            DrawerListChild(
              listTileTitle: 'Reorderable List View',
              appBarTitle: 'Reorderable List View',
              returningWidget: ReorderableListWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Draggable Drag Target',
              appBarTitle: 'Draggable Drag Target',
              returningWidget: DraggableCont(),
            ),
            DrawerListChild(
              listTileTitle: 'Draggable Scrollable Sheet',
              appBarTitle: 'Draggable Scrollable Sheet',
              returningWidget: DraggableScrollableSheetWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Sliver App Bar',
              appBarTitle: 'Sliver App Bar',
              returningWidget: SliverAppBarWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Dismissible List',
              appBarTitle: 'Dismissible List',
              returningWidget: ListView(
                children: [
                  DismissibleListWid(),
                ],
              ),
            ),
            DrawerListChild(
              listTileTitle: 'Clip Path Clipper',
              appBarTitle: 'Clip Path Clipper',
              returningWidget: ClipPathWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Simple Folding Cell',
              appBarTitle: 'Simple Folding Cell',
              returningWidget: SimpleFoldingCellWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Data Table & Hero',
              appBarTitle: 'Data Table & Hero',
              returningWidget: DataTableWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Email Auth',
              appBarTitle: 'Email Auth',
              returningWidget: EmailAuth(),
            ),
            DrawerListChild(
              listTileTitle: 'Generated widget',
              appBarTitle: 'Generated widget',
              returningWidget: GeneratedWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Unicorndial',
              appBarTitle: 'Unicorndial',
              returningWidget: UnicorndialWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Zoom in Zoom out',
              appBarTitle: 'Zoom in Zoom out',
              returningWidget: Zoominout(),
            ),
            DrawerListChild(
              listTileTitle: 'Animated Loaders',
              appBarTitle: 'Flutter Spinkit',
              returningWidget: AnimatedSpinkit(),
            ),
            DrawerListChild(
              listTileTitle: 'Backdrop',
              appBarTitle: 'Backdrop',
              returningWidget: BackdropWidget(),
            ),
            DrawerListChild(
              listTileTitle: 'Backdrop Filter',
              appBarTitle: 'Backdrop Filter',
              returningWidget: BackdropFilterWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Flip Card',
              appBarTitle: 'Flip Card',
              returningWidget: FlipCardWid(),
            ),
            DrawerListChild(
              listTileTitle: '3d listview',
              appBarTitle: '3d listview',
              returningWidget: ListWheel(),
            ),
            DrawerListChild(
              listTileTitle: 'Swipe Detector',
              appBarTitle: 'Swipe Detector',
              returningWidget: SwipeDetectorWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Gesture Detector Ink Well',
              appBarTitle: 'Gesture Detector Ink Well',
              returningWidget: GestureInkWellWid(),
            ),
            DrawerListChild(
              listTileTitle: 'CRUD operations',
              appBarTitle: 'CRUD operations',
              returningWidget: CRUD(),
            ),
            DrawerListChild(
              listTileTitle: 'Drop Down Button',
              appBarTitle: 'Drop down Button',
              returningWidget: DropDownWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Inherited Widget',
              appBarTitle: 'Inherited Widget',
              returningWidget: Class1(),
            ),
            DrawerListChild(
              listTileTitle: 'Scoped Model',
              appBarTitle: 'Scoped Model',
              returningWidget: ScoppedModelWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Bloc pattern',
              appBarTitle: 'Bloc pattern',
              returningWidget: IncrementBloc(),
            ),
            DrawerListChild(
              listTileTitle: 'Animated Charts',
              appBarTitle: 'AnimatedCharts',
              returningWidget: AnimatedCharts(),
            ),
            DrawerListChild(
              listTileTitle: 'Google Play Nested Tabs',
              appBarTitle: 'Google Play Nested Tabs',
              returningWidget: NestedTabs(),
            ),
            DrawerListChild(
              listTileTitle: 'Web Sockets',
              appBarTitle: 'Web Sockets',
              returningWidget: WebSockets(),
            ),
            DrawerListChild(
              listTileTitle: 'Overlay Widget',
              appBarTitle: 'Overlay Widget',
              returningWidget: OverlayWid(),
            ),
            DrawerListChild(
              listTileTitle: 'Toast Message',
              appBarTitle: 'Toast Message',
              returningWidget: Toast(),
            ),
            DrawerListChild(
              listTileTitle: 'Shader Mask',
              appBarTitle: 'Shader Mask',
              returningWidget: ShaderMaskWid(),
            ),
            DrawerListChild(
              listTileTitle: 'SizePtn plchldr Vsblty Spcr',
              appBarTitle: 'SizePstn plchldr Visibility Spacer',
              returningWidget: SizePlacehldrVsblty(),
            ),
          ]),
        ),
      ),
    );
  }
}

class DrawerListChild extends StatefulWidget {
  const DrawerListChild(
      {Key key, this.listTileTitle, this.appBarTitle, this.returningWidget})
      : super(key: key);

  final listTileTitle;
  final appBarTitle;
  final returningWidget;

  @override
  _DrawerListChildState createState() => _DrawerListChildState();
}

class _DrawerListChildState extends State<DrawerListChild> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.listTileTitle),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(widget.appBarTitle),
                    ),
                    body: SafeArea(child: widget.returningWidget))));
      },
    );
  }
}

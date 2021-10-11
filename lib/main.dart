import 'package:flutter/material.dart';
import 'package:tutorialscode/MainDrawer.dart';
//import 'GooglePlayNestedTabs.dart';
import 'SplashScreen.dart';
import 'InheritedWidget/inherited.dart';
import 'package:tutorialscode/InheritedWidget/mycounter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'ScoppedModel/scopedPlugin.dart';
import 'package:bot_toast/bot_toast.dart';
//import 'MainDrawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('ic_launcher');
  // final IOSInitializationSettings initializationSettingsIOS =
  //     IOSInitializationSettings(
  //         requestAlertPermission: true,
  //         requestBadgePermission: true,
  //         requestSoundPermission: true,
  //         onDidReceiveLocalNotification:
  //             (int id, String title, String body, String payload) async {});

  // final InitializationSettings initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (String payload) async {
  //   if (payload != null) {
  //     print('Notification Payload : $payload');
  //   }
  // });

  runApp(MyApp());
}

DonationModel donationModel = DonationModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: InheritedWid(
        myCounter: MyCounter(0),
        child: BotToastInit(
            child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [BotToastNavigatorObserver()],
          title: 'Tutorials Code',
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black54,
              accentColor: Colors.grey),
          home: MyWidget(),
        )),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //GlobalKey _homescaffoldkey = GlobalKey();
  //CameraController cameraController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Function snackBarFunc() {
    //  return Scaffold.of(context).showSnackBar(SnackBar(
    //       content: Text('You are redirected to a snackbar'),
    //       duration: Duration(seconds: 3),
    //       action: SnackBarAction(label: 'OK', onPressed: () {
    //
    // })));
    // }

    //int selectedIndex = 1;
    GlobalKey<ScaffoldState> drawerKey = GlobalKey();

    return Scaffold(
        // key: _homescaffoldkey,
        key: drawerKey,
        appBar: AppBar(
          titleSpacing: -15,
          //leadingWidth: 10,
          //automaticallyImplyLeading: false,
//drawer is not showing up when i activate/uncomment leading property
          // leading: IconButton(
          //   onPressed: () {
          //     //_homescaffoldkey.currentState.openDrawer();
          //   },
          //   icon: Icon(
          //     FontAwesomeIcons.bars,
          //     color: Colors.white,
          //     size: 18.0,
          //   ),
          // ),
          backgroundColor: Colors.black,
          shadowColor: null,
          title: Text('Tutorials Code'),
        ),
        floatingActionButton: FloatingButtonWid(),
        drawer: MainDrawer()
        //  HotstarDrawer((int index) {
        //   print(index);
        //   print(selectedIndex);
        //   setState(() {
        //     selectedIndex = index;
        //   });
        // })
        ,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  drawerKey.currentState.openDrawer();
                },
                child: Text('Camera'),
              ),
              ElevatedButton(
                  onPressed: () {}, child: Text('Local Notification'))
            ],
          ),
        )
        //ListView.builder(
        //     itemCount: 1,
        //     itemBuilder: (context, index) {
        //       if (!cameraController.value.isInitialized) {
        //         return Text('Camera not working');
        //       } else {
        //         return AspectRatio(
        //             aspectRatio: cameraController.value.aspectRatio,
        //             child: CameraPreview(cameraController));
        //       }
        //     })
        // the builder is built to be worked with hotstarDrawer
        // Builder(
        //   builder: (context) {
        //     if (selectedIndex == 0) {
        //       return Center(child: Text('Your downloads'));
        //     } else if (selectedIndex == 1) {
        //       return Center(child: Text('Watchlist'));
        //     } else if (selectedIndex == 2) {
        //       return Center(child: Text('Prizes'));
        //     }
        //     return Container();
        //   },
        // ),
        // Container(
        //     child: PageView(scrollDirection: Axis.vertical, children: [
        //   PageView(
        //     children: [Center(child: Text('Scroll to bottom'))],
        //   ),
        //   PageViewWid(),
        // ])),
        );
  }
}

class FloatingButtonWid extends StatelessWidget {
  const FloatingButtonWid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text('show'),
      onPressed: () {
        //BotToast.showText(text: 'toast');
        //BotToast.showSimpleNotification(title: 'Notification');
        //BotToast.showLoading();
        // BotToast.showCustomText(toastBuilder: (_) {
        //   return Container(
        //     decoration: BoxDecoration(
        //         color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         'Toast has been shown',
        //         style:
        //             TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   );e
        // });
        BotToast.showAttachedWidget(
            attachedBuilder: (_) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width - 80.0,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Expanded(
                              child: Container(
                                height: 280.0,
                                child: Image(
                                  image: AssetImage("images/ironmandark.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0.0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 30.0,
                                  color: Colors.black.withOpacity(0.3),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Mammi'),
                                  ),
                                ))
                          ],
                        ),
                        Positioned(
                          bottom: 0.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.cyan,
                                  size: 32.0,
                                ),
                              ),
                              Icon(
                                Icons.call,
                                color: Colors.cyan,
                                size: 32.0,
                              ),
                              Icon(
                                Icons.videocam,
                                color: Colors.cyan,
                                size: 32.0,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: Colors.cyan,
                                size: 32.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
            duration: Duration(seconds: 10),
            target: Offset(0, 0));
        // return showDialog(
        //     context: context,
        //     child: AlertDialog(
        //       title: Text('Do you want to accept the terms and conditions?'),
        //       content: Text('=> we are not going to theif your data'),
        //       actions: [
        //         FlatButton(
        //             color: Colors.red,
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //             child: Text('DENY')),
        //         FlatButton(
        //             color: Colors.green,
        //             onPressed: () {
        //               Navigator.pop(context);
        //               return;
        //             },
        //             child: Text('ACCEPT'))
        //       ],
        //     ));
      },
    );
  }
}

//      <receiver android:name="com.dexterous.flutterlocalnotifications.ScheduleNotificationBootReceiver">
//               <intent-filter>
//                 <action android:name="android.intent.action.BOOT_COMPLETED"/>
//                 <category android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
//             </intent-filter>
//             </receiver>
//             <receiver android:name="com.dexterous.flutterlocalnotifications.ScheduleNotificationBootReceiver"/>
//<uses-permission android:name= "android.permission.RECEIVE_BOOT_COMPLETED"/>
//   <uses-permission android:name= "android.permission.VIBRATE/>

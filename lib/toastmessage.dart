import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast extends StatelessWidget {
  const Toast({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          print('toast');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AfterToast();
          }));
          // toast length is not working
          Fluttertoast.showToast(
              msg: 'This is a toast',
              backgroundColor: Colors.blue,
              //toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        child: Text('Show toast'),
      ),
    );
  }
}

class AfterToast extends StatefulWidget {
  const AfterToast({Key key}) : super(key: key);

  @override
  _AfterToastState createState() => _AfterToastState();
}

class _AfterToastState extends State<AfterToast> {
  double sliderVal = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('After toast'),
      ),
      body: Center(
        child: Column(
          children: [
            Slider(
                min: 0.0,
                max: 10.0,
                divisions: 10,
                activeColor: Colors.redAccent,
                inactiveColor: Colors.amber,
                value: sliderVal,
                onChanged: (newValue) {
                  setState(() {
                    sliderVal = newValue;
                  });
                }),
            Transform.scale(scale: 2.0, child: Text('Slider Value= $sliderVal'))
          ],
        ),
      ),
    );
  }
}

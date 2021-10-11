import 'package:flutter/material.dart';

class Senders {
  int countN = 0;

  void increaseCount() {
    if (countN < 4) {
      countN++;
    } else if (countN >= 4) {
      countN = 0;
    }
  }
}

class CustomCoursel extends StatefulWidget {
  CustomCoursel({Key key}) : super(key: key);

  @override
  CustomCourselState createState() => CustomCourselState();
}

class CustomCourselState extends State<CustomCoursel> {
  var sendi = Senders();
  // Timer.periodic(Duration(seconds: 3), (timer) {
  //   //print(DateTime.now());
  //   print(sendi.countN);
  //   sendi.increaseCount();
  //   // setState(() {
  //   //    sendi.countN++;
  //   // });
  // });

  int activeCounter = 0;

  @override
  void initState() {
    super.initState();
    allCalls();
  }

  Future allCalls() async {
    // this function is called five times because each time it is called it increments the value of counterN so to increase the value by 5
    // we have to call the function five time and when it is called fifth time the value of counterN is set again to 0 and the process of incrementation starts again
    await incremN();
    await incremN();
    await incremN();
    await incremN();
    await incremN();
  }

  Widget courselComponent({color, firstWord, secWord}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://source.unsplash.com/200x200/?$firstWord,$secWord'))),
      ),
    );
  }

  Widget indicatorItem(index, whatIs) => GestureDetector(
        onTap: () {
          sendi.increaseCount();
          setState(() {
            //activeCounter = index;
          });
        },
        child: Container(
          width: whatIs == index ? 12.0 : 4.0,
          height: 4.0,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
        ),
      );

  List coursels;

  static int counterN = 0;

  Future incremN() async {
    // this delays the icrement of of setState by the Duration given
    await Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        if (counterN < 4) {
          counterN++;
        } else if (counterN == 4) {
          counterN = 0;
        }

        // print("CounterN = $counterN");

        if (counterN == 0) {
          // when the value of counterN gets four it is set again to 0 and to again incremnt them we have to call
          // allCalls() method to keep the process going from 0 to 4
          allCalls();
        }
      });
    });
  }

  List listOfbgColor = [
    Colors.pink,
    Colors.amber,
    Colors.cyan,
    Colors.teal,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              setState(() {
                counterN = 0;
              });
              Navigator.pop(context);
            },
          ),
          title: Text('Custom Coursel')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Manual coursel', style: TextStyle(fontSize: 28.0)),
            Stack(children: [
              Container(
                height: 200.0,
                child: PageView(
                  //allowImplicitScrolling: true,
                  onPageChanged: (index) {
                    setState(() {
                      activeCounter = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    courselComponent(
                        color: Colors.red, firstWord: 'war', secWord: 'action'),
                    courselComponent(
                        color: Colors.amber,
                        firstWord: 'technology',
                        secWord: 'robot'),
                    courselComponent(
                        color: Colors.teal,
                        firstWord: 'avenger',
                        secWord: 'superhero'),
                    courselComponent(
                        color: Colors.limeAccent,
                        firstWord: 'india',
                        secWord: 'rural'),
                    courselComponent(
                        color: Colors.pinkAccent,
                        firstWord: 'bodybuilding',
                        secWord: 'fit')
                  ],
                ),
              ),
              indicatorContainer(context, 20.0, activeCounter)
            ]),
            Text('Automatic coursel', style: TextStyle(fontSize: 28.0)),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: listOfbgColor[counterN],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              indicatorContainer(context, 20.0, counterN)
            ]),
            Text(
              counterN.toString(),
              style: TextStyle(fontSize: 34.0),
            )
          ],
        ),
      ),
    );
  }

  Positioned indicatorContainer(BuildContext context, num pos, whatIsIt) {
    return Positioned(
      bottom: pos,
      left: MediaQuery.of(context).size.width / 2.6,
      //right: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8.0)),
            width: 70.0,
            height: 10.0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  indicatorItem(0, whatIsIt),
                  indicatorItem(1, whatIsIt),
                  indicatorItem(2, whatIsIt),
                  indicatorItem(3, whatIsIt),
                  indicatorItem(4, whatIsIt)
                ])),
      ),
    );
  }
}

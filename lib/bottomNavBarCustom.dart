import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatefulWidget {
  const BottomNavBarCustom({Key key}) : super(key: key);

  @override
  _BottomNavBarCustom createState() => _BottomNavBarCustom();
}

class _BottomNavBarCustom extends State<BottomNavBarCustom> {
  num sliderVal = 1.0;
  int selectedIndex = 1;
  //PageStorageBucket _bucket = PageStorageBucket();

  List<Widget> bodyChild = [
    Center(
      child: Text(
        'Home',
        style: TextStyle(color: Colors.white),
      ),
    ),
    Search(
      key: PageStorageKey('Search'),
    ),
    Trending(
      key: PageStorageKey('Trending'),
    ),
    Profile(
      key: PageStorageKey('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
            builder: (context) => AlertDialog(
                  content: Text('Do you want to close this page?'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text('No')),
                    FlatButton(
                        onPressed: () {
                          // this didn't work
                          // Navigator.pop(context, true);
                          // print('true yes');

                          var count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                          // this will pop 2 pages
                        },
                        child: Text('Yes')),
                  ],
                ),
            context: context);

        return;
      },
      child: Scaffold(
          appBar: AppBar(
            // The title text which will be shown on the action bar
            title: Text('Custom Bottom Nav Bar'),
          ),
          body: //PageStorage(bucket: _bucket, child:
              bodyChild[selectedIndex]
          //)
          ,
          bottomNavigationBar: Container(
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconButtons(Icons.home, 0),
                    iconButtons(Icons.search, 1),
                    iconButtons(Icons.trending_up, 2),
                    iconButtons(Icons.person, 3)
                  ]))),
    );
  }

  iconButtons(icon, index) {
    return Transform.translate(
      offset: selectedIndex == index ? Offset(0, -15.0) : Offset(0, 0),
      child: Transform.scale(
        scale: selectedIndex == index ? 1.2 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.purple : null,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: IconButton(
              icon: Icon(icon,
                  color: selectedIndex == index ? Colors.white : Colors.black),
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with AutomaticKeepAliveClientMixin {
  var listgen = List.generate(200, (index) => Text('Search ${index + 1}'));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      children: listgen,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Trending extends StatefulWidget {
  Trending({Key key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending>
    with AutomaticKeepAliveClientMixin {
  var listgen = List.generate(200, (index) => Text('Trending ${index + 1}'));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listgen,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  var listgen = List.generate(200, (index) => Text('Profile ${index + 1}'));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listgen,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NestedTabs extends StatefulWidget {
  NestedTabs({Key key}) : super(key: key);

  @override
  _NestedTabsState createState() => _NestedTabsState();
}

class _NestedTabsState extends State<NestedTabs> {
  var primarycolor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primarycolor,
              title: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: _googleplayapptitle(),
              ),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 6.0,
                onTap: (index) {
                  setState(() {
                    switch (index) {
                      case 0:
                        primarycolor = Colors.deepOrange;
                        break;
                      case 1:
                        primarycolor = Colors.blue;
                        break;
                      case 2:
                        primarycolor = Colors.pink;
                        break;
                      case 3:
                        primarycolor = Colors.indigo;
                        break;
                      case 4:
                        primarycolor = Colors.lightBlue;
                        break;
                      default:
                    }
                  });
                },
                tabs: [
                  Tab(
                    child: Container(
                      child: Text(
                        'HOME',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'GAMES',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'MOVIES',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'BOOKS',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      child: Text(
                        'MUSIC',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [HomeTopTab(Colors.orange)],
            ),
          )),
    );
  }

  Widget _googleplayapptitle() => Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
          Container(
            child: Text(
              'Google Play',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.microphone,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ));
}

class HomeTopTab extends StatefulWidget {
  HomeTopTab(this.colorVal);
  Color colorVal;

  @override
  _HomeTopTabState createState() => _HomeTopTabState();
}

class _HomeTopTabState extends State<HomeTopTab>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 1);
    tabController.addListener(() {
      setState(() {
        widget.colorVal = Colors.orange;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Colors.orange,
                  indicatorWeight: 4.0,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                        icon: Icon(FontAwesomeIcons.compass,
                            color: tabController.index == 0
                                ? widget.colorVal
                                : Colors.grey),
                        child: Text(
                          'For You',
                          style: TextStyle(
                              color: tabController.index == 0
                                  ? widget.colorVal
                                  : Colors.grey),
                        )),
                    Tab(
                        icon: Icon(FontAwesomeIcons.compass,
                            color: tabController.index == 1
                                ? widget.colorVal
                                : Colors.grey),
                        child: Text(
                          'Top Charts',
                          style: TextStyle(
                              color: tabController.index == 1
                                  ? widget.colorVal
                                  : Colors.grey),
                        )),
                    Tab(
                        icon: Icon(FontAwesomeIcons.compass,
                            color: tabController.index == 2
                                ? widget.colorVal
                                : Colors.grey),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              color: tabController.index == 2
                                  ? widget.colorVal
                                  : Colors.grey),
                        )),
                    Tab(
                        icon: Icon(FontAwesomeIcons.compass,
                            color: tabController.index == 3
                                ? widget.colorVal
                                : Colors.grey),
                        child: Text(
                          'Family',
                          style: TextStyle(
                              color: tabController.index == 3
                                  ? widget.colorVal
                                  : Colors.grey),
                        )),
                    Tab(
                        icon: Icon(FontAwesomeIcons.compass,
                            color: tabController.index == 4
                                ? widget.colorVal
                                : Colors.grey),
                        child: Text(
                          'Early Access',
                          style: TextStyle(
                              color: tabController.index == 4
                                  ? widget.colorVal
                                  : Colors.grey),
                        )),
                    Tab(
                        icon: Icon(FontAwesomeIcons.compass,
                            color: tabController.index == 5
                                ? widget.colorVal
                                : Colors.grey),
                        child: Text(
                          'Editors choice',
                          style: TextStyle(
                              color: tabController.index == 5
                                  ? widget.colorVal
                                  : Colors.grey),
                        )),
                  ]),
            ),
            body: TabBarView(controller: tabController, children: [
              HomeForYouTabs(),
              //HomeTopChartsTabs()
            ]),
          )),
    );
  }
}

class HomeForYouTabs extends StatefulWidget {
  HomeForYouTabs({Key key}) : super(key: key);

  @override
  _HomeForYouTabsState createState() => _HomeForYouTabsState();
}

class _HomeForYouTabsState extends State<HomeForYouTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: 10.0),
          imagecontainer(),
          SizedBox(height: 20.0),
          installedapps(),
          SizedBox(height: 20.0),
          recommendedapps(),
        ],
      ),
    );
  }

  Widget imagecontainer() {
    return Container(
      height: 200.0,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQ9vuCspwcy_6sScxsTHBYsFHNt85aNHGCPw&usqp=CAU'),
      ),
    );
  }

  Widget installedapps() {
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 14.0,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: labelContainer('Previously Installed Apps')),
          Padding(
              padding: EdgeInsets.all(8.0), child: recommendedAppsContainer()),
        ],
      ),
    );
  }

  Widget labelContainer(String labelVal) {
    return Container(
        child: Row(
      children: [
        Text(
          labelVal,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        Text(
          "MORE",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
        )
      ],
    ));
  }

  Widget recommendedAppsContainer() {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          imageSection(
              'data:image/jpeg;base64,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',
              'Amazon Kindle',
              '4.3',
              12),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'data:image/jpeg;base64,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',
              'Facebook',
              '4.4',
              53),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'data:image/png;base64,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',
              'YouTube',
              '4.5',
              38),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'data:image/jpeg;base64,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',
              'Skype',
              '4.2',
              62),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'data:image/jpeg;base64,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',
              'instagram',
              '3.9',
              9)
        ],
      ),
    );
  }

  Widget imageSection(
      String imageVal, String appVal, String rateVal, int appSize) {
    return Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageVal), fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20.0)),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(appVal,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0)),
        SizedBox(
          height: 10.0,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            '$appSize MB',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            rateVal,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Icon(FontAwesomeIcons.solidStar, size: 10.0)
        ])
      ],
    );
  }

  Widget recommendedapps() {
    return Material(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 14.0,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: labelContainer('Recommended Apps')),
          Padding(
              padding: EdgeInsets.all(8.0), child: recommendedAppsContainer()),
        ],
      ),
    );
  }
}

class GameTopTabs extends StatefulWidget {
  GameTopTabs(this.colorVal);
  Color colorVal;
  @override
  _GameTopTabsState createState() => _GameTopTabsState();
}

class _GameTopTabsState extends State<GameTopTabs>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      setState(() {
        widget.colorVal = Colors.blue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                indicatorColor: widget.colorVal,
                indicatorWeight: 4.0,
                tabs: [
                  Tab(
                      icon: Icon(FontAwesomeIcons.compass,
                          color: tabController.index == 0
                              ? widget.colorVal
                              : Colors.grey),
                      child: Text(
                        'For You',
                        style: TextStyle(
                            color: tabController.index == 0
                                ? widget.colorVal
                                : Colors.grey),
                      )),
                  Tab(
                      icon: Icon(FontAwesomeIcons.compass,
                          color: tabController.index == 1
                              ? widget.colorVal
                              : Colors.grey),
                      child: Text(
                        'Top Charts',
                        style: TextStyle(
                            color: tabController.index == 1
                                ? widget.colorVal
                                : Colors.grey),
                      )),
                  Tab(
                      icon: Icon(FontAwesomeIcons.compass,
                          color: tabController.index == 2
                              ? widget.colorVal
                              : Colors.grey),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            color: tabController.index == 2
                                ? widget.colorVal
                                : Colors.grey),
                      )),
                  Tab(
                      icon: Icon(FontAwesomeIcons.compass,
                          color: tabController.index == 3
                              ? widget.colorVal
                              : Colors.grey),
                      child: Text(
                        'Family',
                        style: TextStyle(
                            color: tabController.index == 3
                                ? widget.colorVal
                                : Colors.grey),
                      )),
                  Tab(
                      icon: Icon(FontAwesomeIcons.compass,
                          color: tabController.index == 4
                              ? widget.colorVal
                              : Colors.grey),
                      child: Text(
                        'Early Access',
                        style: TextStyle(
                            color: tabController.index == 4
                                ? widget.colorVal
                                : Colors.grey),
                      )),
                  Tab(
                      icon: Icon(FontAwesomeIcons.compass,
                          color: tabController.index == 5
                              ? widget.colorVal
                              : Colors.grey),
                      child: Text(
                        'Editors choice',
                        style: TextStyle(
                            color: tabController.index == 5
                                ? widget.colorVal
                                : Colors.grey),
                      )),
                ]),
          ),
          body: TabBarView(controller: tabController, children: [
            Column(
              children: [
                Center(
                  child: Text('For You Tabs'),
                )
              ],
            ),
            GameTopChartsTabs(Colors.blue),
          ]),
        ));
  }
}

class GameTopChartsTabs extends StatefulWidget {
  GameTopChartsTabs(this.colorVal);
  Color colorVal;

  @override
  _GameTopChartsTabsState createState() => _GameTopChartsTabsState();
}

class _GameTopChartsTabsState extends State<GameTopChartsTabs>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        widget.colorVal = Colors.blue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          shadowColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: innerNestedTabs(),
          ),
        ));
  }

  Widget innerNestedTabs() {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(child: Container()),
                  TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Colors.blue,
                    indicatorWeight: 5.0,
                    labelPadding: EdgeInsets.all(10.0),
                    tabs: [
                      Text(
                        'TOP FREE',
                        style: TextStyle(
                            color: tabController.index == 0
                                ? widget.colorVal
                                : Colors.grey),
                      ),
                      Text(
                        'TOP GROSSING',
                        style: TextStyle(
                            color: tabController.index == 1
                                ? widget.colorVal
                                : Colors.grey),
                      ),
                      Text(
                        'TRENDING',
                        style: TextStyle(
                            color: tabController.index == 2
                                ? widget.colorVal
                                : Colors.grey),
                      ),
                      Text(
                        'TOP PAID',
                        style: TextStyle(
                            color: tabController.index == 3
                                ? widget.colorVal
                                : Colors.grey),
                      ),
                      Text(
                        'TOP RATED',
                        style: TextStyle(
                            color: tabController.index == 4
                                ? widget.colorVal
                                : Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              height: 200.0,
              child: Center(
                child: Text("TOP FREE"),
              ),
            ),
            Container(
              height: 200.0,
              child: Center(
                child: Text("TOP GROSSING"),
              ),
            ),
            Container(
              height: 200.0,
              child: Center(
                child: Text("TRENDING"),
              ),
            ),
            Container(
              height: 200.0,
              child: Center(
                child: Text("TOP PAID"),
              ),
            ),
            Container(
              height: 200.0,
              child: Center(
                child: Text("TOP RATED"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

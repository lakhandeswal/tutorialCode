import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PageViewWid extends StatefulWidget {
  PageViewWid({Key key}) : super(key: key);

  @override
  _PageViewWidState createState() => _PageViewWidState();
}

class _PageViewWidState extends State<PageViewWid> {
  List<Widget> myList = [
    MainPageView(
      likeCount: 247,
      commentCount: 75,
      shareCount: 19,
      videoSrc:
          'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    ),
    MainPageView(
      likeCount: 692,
      commentCount: 186,
      shareCount: 54,
      //videoSrc: 'http://dl5.webmfiles.org/elephants-dream.webm',
      videoSrc:
          // 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
          'http://mirrors.standaloneinstaller.com/video-sample/lion-sample.mp4',
    ),
    MainPageView(
      likeCount: 86,
      commentCount: 8,
      shareCount: 2,
      videoSrc:
          'http://mirrors.standaloneinstaller.com/video-sample/dolbycanyon.mp4',
    ),
  ];

  PageController pageController = PageController();
  int _currentIndex = 0;

  List<Widget> tabs = [
    Center(
      child: Text('Home'),
    ),
    Center(child: Text('Search')),
    Center(child: Text('Add')),
    Center(child: Text('Inbox')),
    Center(child: Text('Profile'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          //children: tabs,
          // onPageChanged: (int index) {
          //   setState(() {
          //     _currentIndex = index;
          //   });
          //},
          itemCount: myList.length,
          itemBuilder: (BuildContext context, index) {
            return myList[index];
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        selectedFontSize: 0,
        unselectedLabelStyle: TextStyle(fontSize: 0, color: Colors.white),
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, size: 30.0),
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 30.0,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 30.0,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              label: 'Add New',
              icon: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                  child: Icon(
                    Icons.add_outlined,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inbox,
                color: Colors.white,
                size: 30.0,
              ),
              label: 'Inbox'),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                size: 30.0,
              ),
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 30.0,
              ),
              label: 'Me'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}

class MainPageView extends StatefulWidget {
  const MainPageView(
      {Key key,
      this.likeCount,
      this.commentCount,
      this.shareCount,
      this.videoSrc})
      : super(key: key);

  final likeCount;
  final commentCount;
  final shareCount;
  final videoSrc;

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoSrc)
      ..initialize().then((_) => setState(() {}));
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(4.0);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Stack(fit: StackFit.expand, children: [
          Container(
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text('some error occured ',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(width: 10.0),
                          Transform.rotate(
                              angle: 89.55,
                              child: Text(': (',
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900)))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                            //backgroundColor: Colors.white,
                            ),
                      )
                    ],
                  )),
          ),
          Visibility(
            visible: true,
            child: Positioned(
                top: 25.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      Transform.rotate(
                          angle: 29.83,
                          child: Icon(
                            Icons.horizontal_rule,
                            color: Colors.white,
                          )),
                      Text(
                        'For You',
                        style: TextStyle(color: Colors.white38, fontSize: 16.0),
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            right: 0.0,
            bottom: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 24.0,
                    backgroundColor: Colors.white,
                    // child: ,
                  ),
                  PlayerSideBar(
                    icon: Icons.favorite,
                    iconColor: Colors.white,
                    count: widget.likeCount,
                    onPressFunc: () {},
                  ),
                  PlayerSideBar(
                      icon: Icons.comment,
                      iconColor: Colors.white,
                      count: widget.commentCount),
                  PlayerSideBar(
                      icon: Icons.send,
                      iconColor: Colors.white,
                      count: widget.shareCount),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ])
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class PlayerSideBar extends StatefulWidget {
  const PlayerSideBar(
      {Key key, this.icon, this.iconColor, this.count, this.onPressFunc})
      : super(key: key);

  final icon;
  final iconColor;
  final num count;
  final onPressFunc;

  @override
  _PlayerSideBarState createState() => _PlayerSideBarState();
}

class _PlayerSideBarState extends State<PlayerSideBar> {
  @override
  Widget build(BuildContext context) {
    var iconColorN = Colors.white;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print('icon tapped');
              setState(() {
                iconColorN = Colors.red;
              });
            },
            child: Icon(
              widget.icon,
              color: iconColorN,
              size: 50.0,
            ),
          ),
          Text(
            widget.count.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

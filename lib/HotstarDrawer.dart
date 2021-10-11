import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotstarDrawer extends StatelessWidget {
  final Function onPressed;
  HotstarDrawer(this.onPressed);

//   @override
//   _HotstarDrawerState createState() => _HotstarDrawerState();
// }

// class _HotstarDrawerState extends State<HotstarDrawer> {
  bool switchVal = false;

  @override
  Widget build(BuildContext context) {
    Color drawerColor = Theme.of(context).primaryColorDark;
    return SafeArea(
      child: Drawer(
          child: Scrollbar(
        thickness: 4.0,
        child: Container(
          color: drawerColor,
          child: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  'Lakhan Deswal',
                  style: TextStyle(fontSize: 18.0),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '+91 9034909099',
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
                trailing: Icon(Icons.keyboard_arrow_right_outlined,
                    color: Colors.white38),
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 10.0),
                title: Text('KIDS Safe',
                    style: TextStyle(
                      color: Colors.amberAccent,
                    )),
                trailing: Switch(
                  value: switchVal,
                  onChanged: (index) {
                    // setState(() {
                    //   if (switchVal == false) {
                    //     switchVal = true;
                    //     drawerColor = Colors.white;
                    //     print(drawerColor);
                    //   } else if (switchVal == true) {
                    //     switchVal = false;
                    //     drawerColor = Theme.of(context).primaryColorDark;
                    //     print(drawerColor);
                    //   }
                    // });
                  },
                  activeColor: Colors.blue[800],
                ),
                tileColor: Colors.white10,
              ),
              DrawertopListTile(
                  icon: FontAwesomeIcons.download,
                  title: 'Downloads',
                  subtitle: 'Watch Videos Offline',
                  onPress: () {
                    Navigator.pop(context);
                    onPressed(0);
                  },
                  isSelected: true),
              DrawertopListTile(
                  icon: Icons.playlist_add,
                  title: 'Watchlist',
                  subtitle: 'Save to watch later',
                  onPress: () {
                    Navigator.pop(context);
                    onPressed(1);
                  },
                  isSelected: false),
              DrawertopListTile(
                  icon: FontAwesomeIcons.gift,
                  title: 'Prizes',
                  subtitle: 'Prizes you have won',
                  onPress: () {
                    Navigator.pop(context);
                    onPressed(2);
                  },
                  isSelected: false),
              Transform.translate(
                offset: Offset(0, -15.0),
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 10.0),
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(
                      FontAwesomeIcons.film,
                      size: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  title: Transform.translate(
                      offset: Offset(-20, 0),
                      child: Text('Movies',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ))),
                ),
              ),
              Transform.translate(
                  offset: Offset(0, -30.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: CircleAvatar(
                        radius: 9.0,
                        backgroundColor: Colors.grey,
                        child: Center(
                          child: Text('P',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ),
                    ),
                    title: Transform.translate(
                        offset: Offset(-20, 0),
                        child: Text('Premium',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ))),
                  )),
              Transform.translate(
                  offset: Offset(0, -45.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Icon(
                        FontAwesomeIcons.list,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    title: Transform.translate(
                        offset: Offset(-20, 0),
                        child: Text('Channels',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ))),
                  )),
              Transform.translate(
                  offset: Offset(0, -60.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Icon(
                        FontAwesomeIcons.language,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    title: Transform.translate(
                        offset: Offset(-20, 0),
                        child: Text('Languages',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ))),
                  )),
              Transform.translate(
                  offset: Offset(0, -75.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.theater_comedy,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    title: Transform.translate(
                        offset: Offset(-20, 0),
                        child: Text('Genres',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ))),
                  )),
              Transform.translate(
                  offset: Offset(0, -65.0),
                  child: Divider(
                    color: Colors.white12,
                    height: 0.3,
                  )),
              Transform.translate(
                  offset: Offset(0, -65.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10.0),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.help_rounded,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                    title: Transform.translate(
                        offset: Offset(-20, 0),
                        child: Text('Help',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ))),
                  )),
              Transform.translate(
                  offset: Offset(0, -65.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Divider(
                      color: Colors.white12,
                      height: 0.3,
                    ),
                  )),
              Transform.translate(
                  offset: Offset(0, -65.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Colors.white24,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 12.0),
                          Text(
                            '•',
                            style: TextStyle(
                                color: Colors.white24,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 12.0),
                          Text(
                            'T&C',
                            style: TextStyle(
                                color: Colors.white24,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'v11.3.8.957',
                          style: TextStyle(
                              color: Colors.white24,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}

class DrawertopListTile extends StatefulWidget {
  DrawertopListTile(
      {Key key,
      this.icon,
      this.title,
      this.subtitle,
      this.isSelected,
      this.onPress})
      : super(key: key);

  final icon;
  final String title;
  final String subtitle;
  bool isSelected;
  final Function onPress;

  @override
  _DrawertopListTileState createState() => _DrawertopListTileState();
}

class _DrawertopListTileState extends State<DrawertopListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //selected: widget.isSelected,
      onTap: widget.onPress
      // () {
      //   setState(() {
      //     if (widget.isSelected == false) {
      //       widget.isSelected = true;
      //     } else if (widget.isSelected == true) {
      //       widget.isSelected = false;
      //     }
      //   });
      // }
      ,
      //selectedTileColor: Colors.white24,
      contentPadding: EdgeInsets.only(left: 10.0),
      leading: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Icon(
          widget.icon,
          size: 18.0,
          color: Colors.grey,
        ),
      ),
      title: Transform.translate(
          offset: Offset(-20, 0),
          child: Text(widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ))),
      subtitle: Transform.translate(
        offset: Offset(-20, 0),
        child: Text(
          widget.subtitle,
          style: TextStyle(color: Colors.white38, fontSize: 12.0),
        ),
      ),
    );
  }
}

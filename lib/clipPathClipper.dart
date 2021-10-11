import 'package:flutter/material.dart';

class ClipPathWid extends StatefulWidget {
  ClipPathWid({Key key}) : super(key: key);

  @override
  _ClipPathWidState createState() => _ClipPathWidState();
}

class _ClipPathWidState extends State<ClipPathWid> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pink, Colors.lightBlue, Colors.yellow],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                image: DecorationImage(
                    alignment: Alignment.center,
                    image: NetworkImage(
                        'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2020/10/30/Pictures/_583f5e06-1acf-11eb-bfd3-008a2bae3f6c.jpg'))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.filmcompanion.in/wp-content/uploads/2020/10/Film_Companion-Parteek-gandhi-Image-2-min-1280x720.jpg'),
                  radius: 60.0,
                  // child: Image(
                  //   image: NetworkImage(
                  //       "https://www.filmcompanion.in/wp-content/uploads/2020/10/Film_Companion-Parteek-gandhi-Image-2-min-1280x720.jpg"),
                  // ),
                ),
              ),
              Text(
                'Harshad Mehta(SCAM 1992)',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              )
            ],
          )
        ],
      ),
      clipper: HeaderColor(),
    );
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 180);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

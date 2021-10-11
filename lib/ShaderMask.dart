import 'package:flutter/material.dart';

class ShaderMaskWid extends StatefulWidget {
  ShaderMaskWid({Key key}) : super(key: key);

  @override
  _ShaderMaskWidState createState() => _ShaderMaskWidState();
}

class _ShaderMaskWidState extends State<ShaderMaskWid>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Color> _animation1;
  Animation<Color> _animation2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _animation1 = ColorTween(begin: Colors.grey.shade800, end: Colors.white60)
        .animate(_controller);
    _animation2 = ColorTween(begin: Colors.white60, end: Colors.grey.shade800)
        .animate(_controller);

    _controller.forward();

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // subtract appbar's height(56.0) from the height of device's screen and divide that by sum of
    //height of one ShadermaskContainer
    // we are taking 134.0 as the height of two appbars as the space above appbar is also included in it
    // so acc. to calculation 22.0 is extra height other than the appbar's to be subtracted
    int shadersCount =
        ((MediaQuery.of(context).size.height.floor() - 134.0) / 110.0).floor();

    List<Widget> shadermasks = List.generate(shadersCount, (i) {
      return ShadermaskContainer(
          animation1: _animation1, animation2: _animation2);
    });

    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(colors: [Colors.red, Colors.indigo])
                .createShader(rect);
          },
          child: Text(
            'Shader Mask',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: shadermasks.map((e) => e).toList()),
      ),
    );
  }
}

class ShadermaskContainer extends StatelessWidget {
  const ShadermaskContainer({
    Key key,
    @required Animation<Color> animation1,
    @required Animation<Color> animation2,
  })  : _animation1 = animation1,
        _animation2 = animation2,
        super(key: key);

  final Animation<Color> _animation1;
  final Animation<Color> _animation2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(colors: [_animation1.value, _animation2.value])
              .createShader(rect);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 70.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: 10.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              color: Colors.white,
              width: 40.0,
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

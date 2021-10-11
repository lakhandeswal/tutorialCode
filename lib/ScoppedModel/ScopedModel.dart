import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tutorialscode/ScoppedModel/scopedPlugin.dart';

class ScoppedModelWid extends StatefulWidget {
  ScoppedModelWid({Key key}) : super(key: key);

  @override
  _ScoppedModelWidState createState() => _ScoppedModelWidState();
}

class _ScoppedModelWidState extends State<ScoppedModelWid> {
  var hghtValue = 300.0;
  bool priceDonCont = true;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv9rIIXb0mWz9OgtPgKrAOxFgV8XvRgcTLBQ&usqp=CAU'))),
      child: GestureDetector(
        onVerticalDragStart: (hght) {
          setState(() {
            if (hghtValue == 60.0) {
              hghtValue = 300.0;
              priceDonCont = true;
            } else if (hghtValue == 300.0 || hghtValue == 250.0) {
              hghtValue = 60.0;
              priceDonCont = false;
            }
          });
        },
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0)),
                shadowColor: Colors.black,
                child: ScopedModelDescendant<DonationModel>(
                  builder: (context, child, model) {
                    if (model.donatePressed) {
                      return _buildContent(model);
                    } else {
                      return _buildInitContent(model);
                    }
                  },
                ))
          ]),
        ),
      ),
    );
  }

  Widget _buildInitContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: hghtValue,
        child: Column(
          children: [
            _titleContainer(),
            Visibility(visible: priceDonCont, child: _priceContainer(model)),
            Visibility(visible: priceDonCont, child: _donateContainer(model))
          ],
        ),
      ),
    );
  }

  Padding _donateContainer(DonationModel model) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: textEditingController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Message Dexter',
              labelStyle: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            onPressed: () {
              model.donatepressed = true;
              if (textEditingController.text.isNotEmpty) {
                model.textmsg = 'YOU: ${textEditingController.text}';
              } else {
                model.textmsg = '';
              }
            },
            textColor: Colors.white,
            color: Colors.orange[900],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Donate',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Icon(
                    FontAwesomeIcons.paw,
                    color: Colors.white,
                    size: 32.0,
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(38.0)),
          ),
        ],
      ),
    );
  }

  Widget _priceContainer(DonationModel model) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RawMaterialButton(
            onPressed: () {
              model.decrement();
            },
            child: Icon(
              FontAwesomeIcons.minus,
              color: Colors.orange[900],
              size: 38.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white30,
            padding: EdgeInsets.all(10.0),
          ),
          Text(
            '${model.count}',
            style: TextStyle(fontSize: 44.0, color: Colors.black),
          ),
          RawMaterialButton(
            onPressed: () {
              model.increment();
            },
            child: Icon(
              FontAwesomeIcons.plus,
              color: Colors.orange[900],
              size: 38.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white30,
            padding: EdgeInsets.all(10.0),
          )
        ]),
      );

  Widget _titleContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Dexter'.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
        ),
        Transform.scale(
          scale: 3,
          child: Icon(
            Icons.horizontal_rule_rounded,
            color: Colors.black54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'cancel',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.orange[900],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContent(DonationModel model) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300.0,
        child: Column(
          children: [_thankYouText(model), _backButton(model)],
        ),
      ),
    );
  }

  Widget _thankYouText(DonationModel model) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            FontAwesomeIcons.bone,
            color: Colors.orange,
            size: 40.0,
          ),
          Visibility(
            visible: true,
            child: Text('${model.textMsg}',
                style: TextStyle(fontSize: 24.0, color: Colors.orange)),
          ),
          SizedBox(height: 10.0),
          Text('DEXTER says',
              style: TextStyle(fontSize: 24.0, color: Colors.black)),
          Text(
            'Thank you for donating \u0024${model.count}',
            style: TextStyle(fontSize: 20.0, color: Colors.orange),
          )
        ]));
  }

  Widget _backButton(DonationModel model) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.dog,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                model.donatepressed = false;
                textEditingController.clear();
              },
              textColor: Colors.white,
              color: Colors.orange[900],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Donate More',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            SizedBox(width: 10.0),
            Icon(
              FontAwesomeIcons.dog,
              color: Colors.orange[900],
              size: 38.0,
            )
          ],
        ),
      );
}

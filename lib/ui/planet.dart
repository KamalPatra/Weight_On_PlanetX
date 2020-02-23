import 'package:flutter/material.dart';

class PlanetX extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreen();
  }
}

class HomeScreen extends State<PlanetX> {
  int radioValue = 0;
  final TextEditingController _inputController = TextEditingController();
  double _finalResult = 0.0;
  String _message = "";


  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue){
        case 0:
          _finalResult = weightCalculator(_inputController.text, 0.06);
          _message = "Your weight on Pluto is ${_finalResult.toStringAsFixed(2)} lbs";
          break;
        case 1:
          _finalResult = weightCalculator(_inputController.text, 0.38);
          _message = "Your weight on Mars is ${_finalResult.toStringAsFixed(2)} lbs";
          break;
        case 2:
          _finalResult = weightCalculator(_inputController.text, 0.91);
          _message = "Your weight on Venus is ${_finalResult.toStringAsFixed(2)} lbs";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final  _weightOnEarth;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 180.0,
              width: 180.0,
            ),
            new Container(
                margin: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _inputController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        icon: new Icon(Icons.person_outline),
                        labelText: "Your Weight on Earth",
                        hintText: "Weight in Pounds",
                      ),
                    ),
                  ],
                )),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio<int>(
                    activeColor: Colors.orange,
                    value: 0,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                new Text(
                  "Pluto",
                  style: new TextStyle(color: Colors.white),
                ),
                new Radio<int>(
                    activeColor: Colors.red,
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                new Text(
                  "Mars",
                  style: new TextStyle(color: Colors.white),
                ),
                new Radio<int>(
                    activeColor: Colors.brown,
                    value: 2,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged),
                new Text(
                  "Venus",
                  style: new TextStyle(color: Colors.white),
                ),
              ],
            ),
            new Padding(padding: EdgeInsets.all(15.0)),
            //alignment: Alignment.center,
            new Container(
              alignment: Alignment.center,
              child: new Text(
                _inputController.text.isEmpty ? "Please Enter Your Weight on Earth" : _message,
              //"Your weight is $_finalResult",
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800, color: Colors.white),
            ),)
          ],
        ),
      ),
    );
  }

  double weightCalculator(String weight, double surfaceGravity) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0)
    return  int.parse(weight) * surfaceGravity;
    else{
      print("Better luck next time!");}

      return int.parse(weight) * 0.38;
    }
  }


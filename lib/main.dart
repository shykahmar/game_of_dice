import 'dart:math';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  return runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new SplashWidget(),
  ));
}

class SplashWidget extends StatefulWidget {
  // SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new DicePage(),
      title: new Text(
        'FA17-BSE-008 (Farman Ali)',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset('assets/images/farman.jpg'),
      photoSize: 100,
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}

class AppLoader extends StatelessWidget {
  // const AppLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Dice Game'),
        backgroundColor: Colors.blue,
      ),
      body: new DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset(
                'assets/images/dice$leftDiceNumber.png',
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
          //Get students to create the second die as a challenge
          Expanded(
            child: FlatButton(
              child: Image.asset(
                'assets/images/dice$rightDiceNumber.png',
              ),
              onPressed: () {
                changeDiceFace();
              },
            ),
          ),
        ],
      ),
    );
  }
}

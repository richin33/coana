import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_demo/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'coana - Corona Anamnese App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
          fontFamily: 'Montserrat'
      ),
      home: Home(),
    );
  }
}


Widget hackathonLogoSection = Container(
  padding: EdgeInsets.all(16.0),
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage('assets/Logo_Projekt_01.png'),
          height: 130,
        ),
      ],
  ),
);

Widget introTextSection = Container(
  padding: EdgeInsets.all(16.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Padding(
              padding: EdgeInsets.all(16.0),
              child: Image(
                image: AssetImage('assets/coana5bild.png'),
                height: 130,
              ),
            ),
            ],
          ),
      )
    ],
  ),
);

Widget coanaSection = Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

      RaisedButton(
        onPressed: () {},
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: const Text(
              "Hier geht's zum Check",
              style: TextStyle(fontSize: 20)
          ),
        ),
      ),
    ],
  ),
);


Widget appImagesSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(
        image: AssetImage('assets/google-play-badge.png'),
        height: 30,
      ),
      Image(
        image: AssetImage('assets/ios-app-store-badge.png'),
        height: 30,
      ),
    ],
  ),
);

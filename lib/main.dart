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
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('''
    coana hilft dir die richtigen
Maßnahmenschritte einzuleiten
''')
    ],
  ),
);

Widget coanaSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(
        image: AssetImage('assets/coana6bild.png'),
        height: 130,
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
      Image(
        image: AssetImage('assets/Logo_Projekt_01.png'),
        height: 150,
      ),
    ],
  ),
);

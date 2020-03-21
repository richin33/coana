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
      ),
      home: Home(),
    );
  }
}

Widget appImagesSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image(image: AssetImage('assets/google-play-badge.png')),
      Image(image: AssetImage('assets/ios-app-store-badge.png')),
    ],
  ),
);

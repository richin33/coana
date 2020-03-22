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
        primaryColor: Color.fromARGB(0xFF, 0xEE, 0xF2, 0xF8),
          fontFamily: 'Montserrat'
      ),
      home: Home(),
    );
  }
}

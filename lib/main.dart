import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'coana - Corona Anamnese App',
    theme: ThemeData(
        primaryColor: Color.fromARGB(0xFF, 0xEE, 0xF2, 0xF8),
        fontFamily: 'Montserrat'
      ),
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  //coana colors
  Color primaryColor = const Color.fromARGB(0xFF, 0xEE, 0xF2, 0xF8);

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
              padding: EdgeInsets.all(11.0),
              child: Image(
                image: AssetImage('assets/logos/256.png'),
                height: 130,
              ),
            ),
            ],
          ),
        )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: Column(
        children: [
          introTextSection,
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                color: Color.fromARGB(0xFF, 0xEE, 0xF2, 0xF8),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
                child: const Text(
                    "Hier geht's zur App",
                    style: TextStyle(fontSize: 20)
                ),
              ),
            ],
          ),
        ),
          hackathonLogoSection,
          appImagesSection
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topCenter,
          child: Image(
            image: AssetImage('assets/logos/55.png'),
            height: 130,
          ),
        )
        )
      );
  }
}

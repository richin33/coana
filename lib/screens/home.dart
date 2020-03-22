import 'package:flutter/material.dart';
import 'package:flutter_web_demo/colors.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(color: bgColor),
        child: Column(
          children: [
            buildLogo(),
            Flexible(child: buildIntroBox(), fit: FlexFit.loose),
            Flexible(flex: 1, child: Row(
              children: <Widget>[
                Flexible(flex: 1, child: buildAnalysisBox()),
                SizedBox(width: 14),
                Flexible(flex: 1, child: buildAppointmentBox()),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget buildLogo() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Image.asset(
        'assets/coana6bild.png',
        alignment: Alignment.center,
        width: 80,
      ),
    );
  }

  Widget buildIntroBox() {
    return buildBox(
      height: 108,
      image: DecorationImage(
        image: AssetImage('assets/home-header-bg.png'),
        alignment: Alignment.centerRight
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 17, bottom: 17, right: 90),
        child: Text(
          'Coana hilft Dir die richtigen Maßnahmen einzuleiten',
          style: paragraphTextStyle,
        ),
      ),
    );
  }

  Widget buildAnalysisBox() {
    return buildBox(
      child: Column(children: <Widget>[
        Text(
          'Symptome analysieren'.toUpperCase(),
          style: headlineTextStyle,
        ),
        Spacer(),
        Container(child: Image.asset('assets/analysis-icon.png'), height: 75),
        Spacer(),
        buildButton('Start', onPressed: () {}),
      ]),
      height: 230,
    );
  }

  Widget buildAppointmentBox() {
    return buildBox(
      child: Column(children: <Widget>[
        Text(
          'Termin vereinbaren'.toUpperCase(),
          style: headlineTextStyle,
        ),
        Spacer(),
        Container(child: Image.asset('assets/appointment-icon.png'), height: 75),
        Spacer(),
        buildButton('Reservieren', onPressed: () {}),
      ]),
      height: 230,
    );
  }

  Widget buildBox({ Widget child, DecorationImage image, double height }) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: boxBgColor,
        image: image,
        border: Border.fromBorderSide(BorderSide(color: boxBorderColor)),
        borderRadius: BorderRadius.circular(4),
      ),
      height: height,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 14),
      child: child,
    );
  }

  Widget buildButton(String text, { void Function() onPressed }) {
    return FlatButton(
      color: buttonColor,
      textColor: buttonTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Text(text),
      onPressed: onPressed,
    );
  }
}

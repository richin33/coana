import 'package:flutter/material.dart';
import 'package:flutter_web_demo/models/photo.dart';
import 'package:flutter_web_demo/repositories/photos_repository.dart';
import 'package:flutter_web_demo/screens/photo_details.dart';
import 'package:flutter_web_demo/utils/free_functions.dart';
import 'package:flutter_web_demo/widgets/photo_item.dart';

import '../main.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _photoRepository = PhotoRepository();
  final _scrollController = ScrollController();
  List<Photo> photoList = [];
  int _currentPage = 1;
  double _screenSize = 0;

  //coana colors
  Color primaryColor = const Color.fromARGB(0xFF, 0xEE, 0xF2, 0xF8);


  @override
  Widget build(BuildContext context) {
    setState(() => _screenSize = screenWidth(context: context));
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: Image(image: AssetImage('assets/logos/152.png')),
          backgroundColor: primaryColor
      ),
      body: Column(
        children: [
          introTextSection,
          coanaSection,
          hackathonLogoSection,
          appImagesSection
        ],
      ),
    );
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

  Widget coanaSection = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          color: Color.fromARGB(0xFF, 0xEE, 0xF2, 0xF8),
          onPressed: () {},
          child: const Text(
              "Hier geht's zum Check",
              style: TextStyle(fontSize: 20)
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


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getPhotos();
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      final delta = 200;
      if (maxScroll - currentScroll <= delta) {
        _fetchNextPage();
      }
    });
    super.initState();
  }

  void _fetchNextPage() async {
    if (_currentPage <= 20) {
      ++_currentPage;
      final items = await _photoRepository.fetchPhotos(page: _currentPage);
      setState(() => photoList.addAll(items.toList()));
    } else {
      _currentPage = 0;
    }
  }

  void _getPhotos() async {
    final items = await _photoRepository.fetchPhotos(page: _currentPage);
    setState(() => photoList = items.toList());
  }
}

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

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() => _screenSize = screenWidth(context: context));
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage('assets/coana5bild.png')),
          backgroundColor: Color(123)
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

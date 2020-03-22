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

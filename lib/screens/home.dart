import 'package:flutter/material.dart';
import 'package:flutter_web_demo/models/photo.dart';
import 'package:flutter_web_demo/repositories/photos_repository.dart';
import 'package:flutter_web_demo/screens/photo_details.dart';
import 'package:flutter_web_demo/utils/free_functions.dart';
import 'package:flutter_web_demo/widgets/photo_item.dart';

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

  @override
  Widget build(BuildContext context) {
    setState(() => _screenSize = screenWidth(context: context));
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage('assets/coana.png')),
          backgroundColor: Color(123)
      ),
      body: Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Container(
              width: 600,
              height: 500,
              child: Text('CoAna bietet Nutzerinnen und Nutzern einen Fragebogen zur Selbsteinschätzung. Hier werden Symptome, regelmäßige Aufenthaltsorte und Kontaktpersonen abgefragt. Im Anschluss generiert sich ein zunächst anonymes sog. „Infizierungsprofil“, welches Nutzerinnen und Nutzern abstufend angibt, wie hoch die Wahrscheinlichkeit einer Infizierung mit SarsCoV2 ist. Dieses „Infizierungsprofil“ speist sich aus der angegebenen Symptomatik sowie der häuslichen Wohnsituation, insbesondere aber aus dem angegebenen Bewegungsprofil. Ein Beispiel: Ein Kassierer im Supermarkt, welcher die Symptome Halsschmerzen und Husten angibt, hat ein höhere Infizierungswahrscheinlichkeit, wenn sein Arbeitsplatz oder z.B. der Spielplatz, der mit der Tochter besucht wurde, in einem Bezirk liegt, in welchem die Infizierungsrate höher ist als im Nebenbezirk. Im Ergebnis erhalten Nutzerinnen und Nutzer dann eine Handlungsanweisung (Testung durchführen lassen, Selbstquarantäne, Homeoffice, Social Distancing). Dies bietet jedem Einzelnen Orientierung zum weiteren, persönlichen Vorgehen. Insbesondere werden so Personen von Abklärungsstellen ferngehalten, welche dort bei limitierten Testkapazitäten aus verschiedenen Gründen (fehlende Symptomatik, Alter, kein Aufenthalt in Risikogebieten) ohnehin nicht getestet würden. Empfiehlt CoAna jedoch eine Testung durchzuführen, erhalten die Betroffenen direkte Kontaktempfehlungen (z.B. zum zuständige Gesundheitsamt). Falls sie es wünschen, können die Betroffenen aber auch ihre Telefonnummer angeben und werden dann je nach Dringlichkeit von der zuständigen Institution kontaktiert. Im Ergebnis werden so Personen aus Nicht-Risikogruppen bereits zu Hause abgefangen, Kommunikationswege kanalisiert und Insitutionen entlastet.'),
            ),
          ),
        ),
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

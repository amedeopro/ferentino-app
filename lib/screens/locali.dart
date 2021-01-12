import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ferentino/models/locale.dart';

class Locali extends StatefulWidget {
  @override
  _LocaliState createState() => _LocaliState();
}

class _LocaliState extends State<Locali> {
  List<Locale> locali = List<Locale>();

  Future testServeNode() async {
    final String url = 'http://localhost:8080/feed/posts';

    try {
      http.get(url).then((res) {
        final resJson = jsonDecode(res.body);
        final localiMap = resJson['locali'];
        locali =
            localiMap.map<Locale>((mappa) => Locale.fromMap(mappa)).toList();
        setState(() {
          locali = locali;
        });
      });
    } catch (errore) {
      print(errore);
    }
  }

  Widget menu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Locali',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://i.pravatar.cc/300',
                    ),
                    fit: BoxFit.cover)
//              color: Color(0xFF890000),
                ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.child),
            title: Text('Voce 1'),
            onTap: () {
              print('Voce 1');
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    testServeNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF890000),
          title: Text('Locali'),
        ),
        drawer: menu(),
        body: ListView.builder(
          itemCount: locali.length,
          itemBuilder: (BuildContext context, int posizione) {
            return Card(
              elevation: 2,
              child: ListTile(
                onTap: () {
                  MapsLauncher.launchCoordinates(locali[posizione].latitudine, locali[posizione].longitudine, locali[posizione].nomeLocale);
                },
                leading: Image.network(
                  locali[posizione].immagine,
                  scale: 1,
                ),
                title: Text(locali[posizione].nomeLocale),
                subtitle: Text(locali[posizione].indirizzo),
              ),
            );
          },
        ));
  }
}

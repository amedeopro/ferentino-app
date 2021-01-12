import 'package:flutter/material.dart';
import 'package:ferentino/monumento.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ferentino/screens/home.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  List<Monumento> monumenti = List<Monumento>();
  String meteoFerentino;
  String iconaMeteo;

  bool mfg;
  bool mg;


  @override
  void initState() {
    super.initState();
    meteoFerentinoGet();
    monumentiGet();
  }

  Future monumentiGet() async {
    final String url = 'https://www.ferentino.org/wp-json/wp/v2/posts?categories=207';

      http.get(url).then((res) {
        final resJson = json.decode(res.body);
        monumenti = resJson
            .map<Monumento>((mappa) => Monumento.fromMap(mappa))
            .toList();

          monumenti = monumenti;

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HomeScreen(ferentinoPosts: monumenti, ferentinoMeteo: meteoFerentino, iconaMeteo: iconaMeteo,);
        }
        )
        );

      });


  }

  Future meteoFerentinoGet() async {
    var dio = Dio();
    Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=ferentino&units=metric&lang=it&appid=46e5086156886012889d5851df8cbff9');
    final resJson = response.data;
    meteoFerentino = resJson['main']['temp'].toStringAsFixed(0);

    iconaMeteo = resJson['weather'][0]['main'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black,
          size: 100,
        ),
      ),
    );
  }
}


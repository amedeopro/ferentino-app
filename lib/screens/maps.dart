import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_html/flutter_html.dart';


class FerentinoMaps extends StatefulWidget {

  FerentinoMaps({this.monumenti});

  final monumenti;

  @override
  _FerentinoMapsState createState() => _FerentinoMapsState();
}

class _FerentinoMapsState extends State<FerentinoMaps> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;
  String titleSliding;
  int index;


  void setCustomMarker() async{
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'images/ponte_sereno64.png');
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(41.69229427034531, 13.250975984671667),
          infoWindow: InfoWindow(
            title: 'Ferentino',
            snippet: 'Città di storia, arte e cultura'
          )
        )
      );

      _markers.add(
          Marker(
          markerId: MarkerId('id-2'),
          position: LatLng(41.690838, 13.257059),
          onTap: (){
            setState(() {
              titleSliding = 'Archi di Casamari';
            });
            print('Archi di Casamari');
          },
          infoWindow: InfoWindow(
              title: 'Archi di Casamari',
              snippet: 'Archi storici'
          )
      )
      );

      _markers.add(
          Marker(
              markerId: MarkerId('id-3'),
              position: LatLng(41.704744, 13.266965),
              onTap: (){
                setState(() {
                  index = 0;
                  titleSliding = 'Ponte Sereno';
                });
              },
              icon: mapMarker,
              infoWindow: InfoWindow(
                  title: 'Ponte Sereno',
                  snippet: 'Ponte romano'
              )
          )
      );

      _markers.add(
          Marker(
              markerId: MarkerId('id-4'),
              position: LatLng(41.6909316279625, 13.25816582594094),
              onTap: (){
                setState(() {
                  index = 1;
                  titleSliding = 'Testamento di Auolo Quintilio';
                });
              },
              icon: mapMarker,
              infoWindow: InfoWindow(
                  title: 'Testamento di Auolo Quintilio',
                  snippet: 'Testamento'
              )
          )
      );

    });
  }


  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.monumenti[1].nomeMonumento);
    return Scaffold(
      appBar: AppBar(
        title: Text('Visita Ferentino'),
        backgroundColor: Color(0xFF890000),
        leading: Container(),
      ),
      body: SlidingUpPanel(
        panel: Container(
            child: Padding(
              padding: EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                ClipRRect(
                    child: Image.network(
                      (index != null) ? widget.monumenti[index]?.immagine : 'https://www.ferentino.org/wp-content/uploads/2020/11/Finale16%C2%B0anno.png',
                    )),
                Text(
                  (index != null) ? widget.monumenti[index]?.nomeMonumento : 'Seleziona un monumento',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Html(data: (index != null) ? widget.monumenti[index]?.intro : 'Seleziona un monumento'),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
              target: LatLng(41.69229427034531, 13.250975984671667), zoom: 14),
        ),
      )
    );
  }
}

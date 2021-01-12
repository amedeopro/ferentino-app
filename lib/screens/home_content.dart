import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:ferentino/Services/iconData.dart' as customIcon;
// import 'package:ferentino/components/navigationMenu.dart';


class HomeContent extends StatefulWidget {

  HomeContent({this.monumenti});

  final monumenti;

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF890000), Color(0xFF520000)]),
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.ferentino.org/wp-content/uploads/2020/11/logo_pulito.png'),
              ),
            ),
          ),
        ),
//          Container(
//            margin: EdgeInsets.symmetric(horizontal: 20),
//            height: 70,
//            width: double.infinity,
//            decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(25),
//              border: Border.all(
//                color: Color(0xFFFFFFFF),
//              ),
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.grey.withOpacity(0.5),
//                  spreadRadius: 5,
//                  blurRadius: 7,
//                  offset: Offset(0, 3), // changes position of shadow
//                ),
//              ],
//            ),
//            child: Padding(
//              padding: const EdgeInsets.all(12.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                children: <Widget>[
//                  Text(
//                    'Oggi a Ferentino ci sono ' +
//                        widget.ferentinoMeteo +
//                        ' gradi',
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                  Icon(
//                    customIcon.getIconFromName(widget.iconaMeteo),
//                  ),
//                ],
//              ),
//            ),
//          ),
        Padding(
          padding: EdgeInsets.only(bottom: 10, left: 10),
          child: Container(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.monumenti.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.only(right: 22.0),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              widget.monumenti[index]?.immagine),
                          fit: BoxFit.cover,
                          scale: 2.0,
                        ),
                      ),
                      width: 200.0,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.monumenti[index]?.nomeMonumento,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0,
                                  ),
                                  Text(
                                    'Scopri di più',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                itemCount: widget.monumenti.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset:
                            Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.network(
                                widget.monumenti[index]?.immagine,
                              )),
                          Text(
                            widget.monumenti[index]?.nomeMonumento,
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
                              Html(data: widget.monumenti[index]?.intro),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
//          NavigationMenu(link1: HomeScreen(), labelLink1: 'Home', link2: FerentinoMaps(), labelLink2: 'Visita Ferentino', labelLink3: 'Info',),
      ],
    );
  }
}


class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
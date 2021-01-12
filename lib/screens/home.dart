import 'package:ferentino/screens/home_content.dart';
import 'package:ferentino/screens/locali.dart';
import 'package:ferentino/screens/maps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.ferentinoPosts, this.ferentinoMeteo, this.iconaMeteo});

  final ferentinoPosts;
  final ferentinoMeteo;
  final iconaMeteo;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {


    final List<Widget> _children = [HomeContent(monumenti: widget.ferentinoPosts), FerentinoMaps(monumenti: widget.ferentinoPosts,), Locali()];


    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.blueGrey,
          selectedItemBackgroundColor: Color(0xFF890000),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: _currentIndex,
          items: [
            FFNavigationBarItem(
                iconData: FontAwesomeIcons.university,
                label: 'Home',

            ),
            FFNavigationBarItem(
              iconData: FontAwesomeIcons.mapSigns,
              label: 'Visita Ferentino',

            ),
            FFNavigationBarItem(
              iconData: FontAwesomeIcons.ticketAlt,
              label: 'Locali',

            ),
          ],
        onSelectTab: (index){
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}






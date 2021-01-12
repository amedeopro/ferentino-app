import 'package:flutter/material.dart';


class NavigationMenu extends StatelessWidget {

  NavigationMenu({this.link1, this.labelLink1, this.link2, this.labelLink2, this.link3, this.labelLink3});

  Widget link1;
  String labelLink1;
  Widget link2;
  String labelLink2;
  Widget link3;
  String labelLink3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return link1;
              }));
            },
            child: Container(
                child:
                Text(labelLink1)
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return link2;
              }));
            },
            child: Container(
                child:
                Text(labelLink2)
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return link3;
              }));
            },
            child: Container(
                child:
                Text(labelLink3)
            ),
          )
        ],
      ),
    );
  }
}
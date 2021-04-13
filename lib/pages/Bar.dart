import 'package:flutter/material.dart';
class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(
      backgroundColor: Color(0xffF20E07),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        iconSize: 30,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          iconSize: 30,
          onPressed: () {},
        ),
      ],
    ),);
  }
}

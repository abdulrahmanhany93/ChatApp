import 'package:chat/widgets/categorySelector.dart';
import 'package:chat/widgets/favoriteContacts.dart';
import 'package:chat/widgets/recentChats.dart';
import 'package:flutter/material.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: CategorySelector()),
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF4E8D9),
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              children: [
                FavoriteContacts(),
                RecentChats(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

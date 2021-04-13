import 'package:chat/pages/onlinePage.dart';
import 'package:chat/widgets/favoriteContacts.dart';
import 'package:chat/widgets/recentChats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'file:///D:/Projects/chat/lib/widgets/categorySelector.dart';
import '../model/massegeModel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF20E07),
        appBar: AppBar(
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
        ),
        body: Column(
          children: [
            Expanded(flex: 1, child: CategorySelector()),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF4E8D9),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        FavoriteContacts(),
                        RecentChats(),
                      ],
                    ),
                    OnlinePage(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

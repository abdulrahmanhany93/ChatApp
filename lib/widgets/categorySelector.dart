import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
 final List<String> categories = ['Messages', 'Online', 'Group', 'Requests'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
        margin: EdgeInsets.only(right: 30),
        child: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex=index;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      letterSpacing: 1.2,
                      fontSize: 25,
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
        ));
  }
}

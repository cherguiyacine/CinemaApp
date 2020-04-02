import 'package:flutter/material.dart';

class AllShowsPage extends StatefulWidget {
  @override
  _AllShowsPageState createState() => _AllShowsPageState();
}

class _AllShowsPageState extends State<AllShowsPage> {
  List<bool> isSelected = [true];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff5f7f9),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "X9CINEMA",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.search),
                Icon(Icons.menu),
              ],
            ),
            ToggleButtons(
              isSelected: isSelected,
              children: <Widget>[
                Text("Netflix"),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

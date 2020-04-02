import 'package:cinemaapp/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieDescriptionState();
  }
}

class MovieDescriptionState extends State<MovieDescription> {
  Movie _movieToShow = Movie();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF5F7F9),
          /*    appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
              ),
              onPressed: () {
                print("hey");
              },
            ),
            actions: <Widget>[
              // action button
            ],
            title: Text(
              "${_movieToShow.name} FURY-ROAD",
              style: TextStyle(color: Colors.black),
            ),
          ),*/
          body: Stack(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 25,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        print("hey");
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "${_movieToShow.name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "- FURY ROAD  ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            // fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

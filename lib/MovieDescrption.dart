import 'package:cinemaapp/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieDescriptionState();
  }
}

Widget costumAppBar(String movieName) {
  return Stack(
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
                print("movieName");
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  movieName,
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
  );
}

class MovieDescriptionState extends State<MovieDescription> {
  Movie _movieToShow = Movie();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF5F7F9),
          body: Column(
            children: <Widget>[
              costumAppBar(_movieToShow.name),
              new Padding(padding: new EdgeInsets.all(5.3)),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'images/madmax.jpg',
                        ),
                        width: widthScreen * 0.9,
                        height: 240.0,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 15,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            iconSize: 25,
                            icon: Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            iconSize: 25,
                            icon: Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            iconSize: 25,
                            icon: Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            iconSize: 25,
                            icon: Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(30.0),
                            bottomLeft: const Radius.circular(30.0)),
                      ),
                      height: 240.0,
                      width: widthScreen * 0.3,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 240.0 * 0.20,
                              child: Center(
                                child: Text(
                                  _movieToShow.time,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Text("____"),
                            Container(
                              height: 240.0 * 0.20,
                              child: Center(
                                child: Text(
                                  "Action",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Text("____"),
                            Container(
                              height: 240.0 * 0.20,
                              child: Center(
                                child: Text(
                                  "4.5",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            Text("____"),
                            Container(
                              height: 240.0 * 0.20,
                              child: Center(
                                child: IconButton(
                                  iconSize: 25,
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    print("movieName");
                                  },
                                ),
                              ),
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

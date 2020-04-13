import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Movie.dart';
import 'package:cinemaapp/MovieDescrption.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllShowsPage extends StatefulWidget {
  @override
  _AllShowsPageState createState() => _AllShowsPageState();
}

class _AllShowsPageState extends State<AllShowsPage> {
  List<bool> _list = [
    true,
    false,
    false,
    false,
    false,
    false
  ]; // for companies buttons states // Selected or not
  List<Movie> listMovies = [];
  final _firestore = Firestore.instance;

  List<String> moviesCoversLinks = [];
  //int _currentMovie = 0; // for Movies Caroussel
  int _currentIndex = 1;

  initMoviesList() async {
    moviesCoversLinks.clear();
    listMovies.clear();
    Movie m1 = new Movie();
    m1.coverLink = 'assets/joker.jpg';
    moviesCoversLinks.add('assets/joker.jpg');
    Movie m2 = new Movie();
    m2.coverLink = 'assets/cover1.png';
    moviesCoversLinks.add('assets/cover1.png');

    Movie m3 = new Movie();
    m3.coverLink = 'images/madmax.jpg';
    moviesCoversLinks.add('images/madmax.jpg');
    Movie m = new Movie();
    await for (var snapshot in _firestore
        .collection('platforme')
        .document('netflix')
        .collection('movies')
        .snapshots()) {
      for (var platforme in snapshot.documents) {
        m = new Movie();
        m.name = platforme.data['name'].toString();
        listMovies.add(m);
        print(
            platforme.data['name']); // get only name field in collection movie
      }
      print("TTTT===========>");
      print(listMovies.length);
    }

    /* final platforme = await _firestore
        .collection('platforme')
        .document('netflix')
        .collection('movies')
        .getDocuments();
    for (var movie in platforme.documents) {
      m = new Movie();
      m.name = movie.data['name'].toString();
      listMovies.add(m);
      print(movie.data['name']);
    }
    print("TTTT===========>");
    print(listMovies.length);*/
    //Movie m4 = new Movie();
    //  m4.coverLink = 'assets/shazam.jpeg';
    // moviesCoversLinks.add('assets/shazam.jpeg');
  }

  List<String> companies = [
    "Recomended",
    "Netflix",
    "HBO",
    "AppleTv",
    "Amazon",
    "Hulu"
  ];

  @override
  Widget build(BuildContext context) {
    initMoviesList();
    print("---->>>>");
    print(listMovies.length);
    print(moviesCoversLinks.length);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff5f7f9),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.theaters,
                color: (_currentIndex == 0) ? Color(0xFFFD0A4C) : Colors.grey,
              ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(
                Icons.whatshot,
                color: (_currentIndex == 1) ? Color(0xFFFD0A4C) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(
                Icons.bookmark,
                color: (_currentIndex == 2) ? Color(0xFFFD0A4C) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: Icon(
                Icons.person,
                color: (_currentIndex == 3) ? Color(0xFFFD0A4C) : Colors.grey,
              ),
            )
          ],
          onTap: (index) {
            print(index);
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "X9",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Cinema",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.menu),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 48,
              child: ListView.builder(
                  itemCount: companies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            FlatButton(
                              color: _list[index]
                                  ? Color(0xfffd0a4c)
                                  : Color(0xfff5f7f9),
                              child: Text(
                                companies[index],
                                style: TextStyle(
                                    color: _list[index]
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Proxima'),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(21.0)),
                              onPressed: () {
                                setState(() {
                                  _list[index] = true;
                                  for (int i = 0; i < companies.length; i++) {
                                    if (i != index) {
                                      _list[i] = false;
                                    }
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Movies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Proxima',
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 328,
                    child: ListView.builder(
                        itemCount: moviesCoversLinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int indexMovies) {
                          return Column(
                            children: <Widget>[
                              FlatButton(
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        moviesCoversLinks[indexMovies]),
                                    width: 230.0,
                                    height: 300.0,
                                  ),
                                ),
                                onPressed: () {
                                  initMoviesList();
                                },
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Joker (2019)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Series",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Proxima',
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 328,
                    child: ListView.builder(
                        itemCount: moviesCoversLinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int indexMovies) {
                          return Column(
                            children: <Widget>[
                              FlatButton(
                                child: ClipRRect(
                                  borderRadius: new BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        moviesCoversLinks[indexMovies]),
                                    width: 230.0,
                                    height: 300.0,
                                  ),
                                ),
                                onPressed: () {
                                  print("hello corona");
                                },
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Joker (2019)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

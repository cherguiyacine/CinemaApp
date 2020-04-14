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
  final _firestore = Firestore.instance;

  List<String> moviesCoversLinks = [];
  //int _currentMovie = 0; // for Movies Caroussel
  int _currentIndex = 1;
  int companyIndex = 0;
  List<String> companies = [
    "Recomended",
    "netflix",
    "HBOGO",
    "AppleTv",
    "Amazon",
    "Hulu"
  ];

  @override
  Widget build(BuildContext context) {
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
                                  companyIndex = index;
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
                  StreamBuilder(
                    stream: _firestore
                        .collection('platforme')
                        .document(companies[companyIndex])
                        .collection('movies')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final movies = snapshot.data.documents;
                        List<Movie> moviesList = [];
                        for (var movie in movies) {
                          Movie m = new Movie();
                          m.name = movie.data['name'];
                          m.releaseYear = movie.data['releaseYear'];
                          m.synopsis = movie.data['synopsis'];
                          m.time = movie.data['time'];
                          m.coverLink = movie.data['coverLink'];

                          print(m.coverLink);
                          moviesList.add(m);
                        }
                        return SizedBox(
                          height: 328,
                          child: ListView.builder(
                              itemCount: moviesList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (BuildContext context, int indexMovies) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      child: ClipRRect(
                                        borderRadius: new BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        child: Image.network(
                                          moviesList[indexMovies].coverLink,
                                          fit: BoxFit.fill,
                                          width: 230.0,
                                          height: 300.0,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      moviesList[indexMovies].name +
                                          ' (${moviesList[indexMovies].releaseYear})',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    },
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
                    height: 16,
                  ),
                  StreamBuilder(
                    stream: _firestore
                        .collection('platforme')
                        .document('netflix')
                        .collection('movies')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final movies = snapshot.data.documents;
                        List<String> moviesWidgets = [];
                        for (var movie in movies) {
                          final movieName = movie.data['name'];
                          moviesWidgets.add(movieName);
                        }
                        return SizedBox(
                          height: 328,
                          child: ListView.builder(
                              itemCount: moviesWidgets.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (BuildContext context, int indexMovies) {
                                return Column(
                                  children: <Widget>[
                                    FlatButton(
                                      child: ClipRRect(
                                        borderRadius: new BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        child: Image.network(
                                          "https://static1.purebreak.com.br/articles/4/22/45/4/@/113261--the-walking-dead-a-serie-dos-zumbis-m-950x0-2.jpg",
                                          fit: BoxFit.fill,
                                          width: 230.0,
                                          height: 300.0,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      moviesWidgets[indexMovies],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

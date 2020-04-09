import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Movie.dart';
import 'package:cinemaapp/MovieDescrption.dart';

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
  List<String> moviesCoversLinks = [];
  int _currentMovie = 0; // for Movies Caroussel
  initMoviesList() {
    Movie m1 = new Movie();
    m1.coverLink = 'assets/joker.jpg';
    moviesCoversLinks.add('assets/joker.jpg');
    Movie m2 = new Movie();
    m2.coverLink = 'assets/cover1.png';
    moviesCoversLinks.add('assets/cover1.png');

    Movie m3 = new Movie();
    m3.coverLink = 'images/madmax.jpg';
    moviesCoversLinks.add('images/madmax.jpg');

    Movie m4 = new Movie();
    m4.coverLink = 'assets/shazam.jpeg';
    moviesCoversLinks.add('assets/shazam.jpeg');

    listMovies.add(m1);
    listMovies.add(m2);
    listMovies.add(m3);
    listMovies.add(m4);
  }

  List<String> companies = [
    "Recomended",
    "Netflix",
    "HBO",
    "AppleTv",
    "Amazon",
    "Hulu"
  ];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    moviesCoversLinks.clear();
    listMovies.clear();
    initMoviesList();

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
                    height: 300,
                    child: ListView.builder(
                        itemCount: moviesCoversLinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int indexMovies) {
                          return Container(
                            child: Stack(
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
                                    print("Holaa amigo ");
                                  },
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 50,
                                  child: Container(
                                    child: ratingBar(3),
                                    //  child: StarDisplay(value: 2.5),
                                  ),
                                ),
                                Positioned(
                                    top: 180,
                                    left: 50,
                                    child: Text(
                                      "Drive",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 48),
                                    )),
                                Positioned(
                                    top: 230,
                                    left: 50,
                                    child: Text(
                                      "Al Mokhrij Name",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )),
                              ],
                            ),
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
                    height: 300,
                    child: ListView.builder(
                        itemCount: moviesCoversLinks.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int indexMovies) {
                          return Container(
                            child: FlatButton(
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
                                print("Holaa amigo ");
                              },
                            ),
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

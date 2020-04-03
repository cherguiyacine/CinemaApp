import 'package:cinemaapp/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class MovieDescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieDescriptionState();
  }
}

class MovieDescriptionState extends State<MovieDescription> {
  Movie _movieToShow = Movie();
  List<String> imgList = [
    "images/tom.jpg",
    "images/hoult.jpg",
    "images/charl.jpg",
    "images/charl.jpg",
    "images/hoult.jpg",
    "images/charl.jpg",
    "images/hoult.jpg",
    "images/charl.jpg",
  ];
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    int _current;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF5F7F9),
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
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                costumAppBar(_movieToShow.name),
                new Padding(padding: new EdgeInsets.all(5.3)),
                movieInfo(_movieToShow, heightScreen, widthScreen),
                new Padding(padding: new EdgeInsets.all(5.3)),
                Row(
                  children: <Widget>[
                    Text(
                      "  Synopsis",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                new Padding(padding: new EdgeInsets.all(5.3)),
                Container(
                  width: widthScreen * 0.8,
                  child: Text(
                    _movieToShow.synopsis,
                    style: new TextStyle(
                        fontSize: 15.9,
                        color: Colors.grey[500],
                        fontFamily: 'Raleway'),
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(5.3)),
                Row(
                  children: <Widget>[
                    Text(
                      "  Cast",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                new Container(
                  height: 100.0,

                  // color: Colors.black,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return new Card(
                        margin: EdgeInsets.all(8),
                        color: Color(0xFFF5F7F9),
                        child: InkWell(
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(10.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                imgList[index],
                              ),
                              width: 80.0,
                              height: 80.0,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _current = index;
                            });
                            print(index);
                          },
                        ),
                      );
                    },
                    itemCount: imgList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget movieInfo(Movie _movieToShow, double heightScreen, double widthScreen) {
  return Stack(
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
        left: 25,
        child: Container(
          child: ratingBar(_movieToShow.mark),
          //  child: StarDisplay(value: 2.5),
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
  );
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

/*
class StarDisplay extends StatelessWidget {
  final double value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.white,
        );
      }),
    );
  }
}
*/
Widget ratingBar(double value) {
  return RatingBar.readOnly(
    initialRating: value,
    isHalfAllowed: true,
    halfFilledIcon: Icons.star_half,
    filledIcon: Icons.star,
    emptyIcon: Icons.star_border,
    size: 25,
    filledColor: Colors.white,
    emptyColor: Colors.white,
    halfFilledColor: Colors.white,
  );
}

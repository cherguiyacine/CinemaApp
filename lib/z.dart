import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qissa_app/Book.dart';

import 'Ebook.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  final GlobalKey _scaffoldKey = new GlobalKey();

  int currentElementInListView = 0;
  int _current = 0;
  List imgList = [];
  void initImgList() {
    // List of books covers links to display in caroussel
    imgList = [
      'assets/cover1.png',
      'assets/cover2.jpg',
      'assets/cover3.jpg',
      'assets/cover4.jpg',
    ];
  }

  List<Book> bookList = [];
  void initBooksLIst() {
    // List of books to display on ListView
    Book b1 = new Book("Rudyard kipling", "The Jungle Book", 19.99, 4.8, 2390,
        'assets/cover3.jpg');
    Book b2 = new Book(
      "J.R.R tolkeien",
      "The Hobbit",
      32.99,
      9.8,
      8302,
      'images/hobbit.jpg',
    );
    bookList.clear();
    bookList.add(b1);
    bookList.add(b2);
  }

  @override
  Widget build(BuildContext context) {
    initImgList();
    initBooksLIst();
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF100b20),
          drawer: NavDrawer(),
          body: Container(
            child: new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.fromLTRB(0, 0, 0, 0)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
                new SizedBox(
                  height: 21,
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                        child: CarouselSlider(
                            initialPage: 0,
                            height: 250,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            items: imgList.map((imgUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    child: FlatButton(
                                      child: ClipRRect(
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                        child: Image(
                                          fit: BoxFit.fill,
                                          image: AssetImage(imgUrl),
                                          width: 180.0,
                                          height: 250.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        print("Holaa amigo ");
                                      },
                                    ),
                                  );
                                },
                              );
                            }).toList())),
                  ],
                ),
                new SizedBox(
                  height: 21,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Best Seller',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sen',
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, indice) {
                      return new Column(
                        children: <Widget>[
                          FlatButton(
                            child: new Row(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage(bookList[indice].imgLink),
                                    width: 90.0,
                                    height: 120.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Wrap(
                                  direction: Axis.vertical,
                                  children: <Widget>[
                                    Text(
                                      bookList[indice].titre,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: 'playFair'),
                                    ),
                                    Text(
                                      bookList[indice].auteur,
                                      style: TextStyle(
                                          color: Colors.white30,
                                          fontFamily: 'Sen'),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          bookList[indice].price.toString() +
                                              " e",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          bookList[indice].mark.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          "  " +
                                              bookList[indice].views.toString(),
                                          style: TextStyle(
                                            color: Colors.white30,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Ebook(bookList[indice])),
                              );
                            },
                          ),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      );
                    },
                    itemCount: bookList.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 200,
            width: 150,
            child: DrawerHeader(
              child: Image(
                image: AssetImage(
                  './images/logo.png',
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF100b20),
                  image: DecorationImage(image: AssetImage('images/face.jpg'))),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favorite'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

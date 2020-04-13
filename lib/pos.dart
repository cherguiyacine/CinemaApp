Positioned(
                                  bottom: 10,
                                  left: 50,
                                  child: Container(
                                    child: ratingBar(3.7),
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









  
  initMoviesList() async {
    Movie m = new Movie() ;
    await for (var snapshot in _firestore
        .collection('platforme')
        .document('netflix')
        .collection('movies')
        .snapshots()) {
      for (var platforme in snapshot.documents) {
        m = new Movie()
        print(platforme.data['name']); // get only name field in collection movie
        m.name = platforme.data['name'] ; 
        listMovies.add(m);
      }
   
  }




  /* void movieStream() async {
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
    }
    /*final platforme = await _firestore
        .collection('platforme')
        .document('netflix')
        .collection('movies')
        .getDocuments();
    for (var movie in platforme.documents) {
      print(movie.data['name']);
    }*/
  }*/
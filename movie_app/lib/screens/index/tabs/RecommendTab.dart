import 'package:flutter/material.dart';
import 'package:movie_app/components/Carousel/CarouselImageFrame.dart';
import 'package:movie_app/components/Carousel/CarouselWithIndicator.dart';
import 'package:movie_app/components/Image/ExtendedImage.dart';

class RecommendTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          CarouselWithIndicator(
            children: <Widget>[
              CarouselImageFrame(image: 'images/joker_fanart.jpg'),
              CarouselImageFrame(image: 'images/joker_fanart.jpg'),
              CarouselImageFrame(image: 'images/joker_fanart.jpg')
            ],
          ),
          MovieList()
        ],
      ),
    );
  }
}

var movieList = getMovies();

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: getMovies()
          .map((movie) => MovieRow(
                item: movie,
              ))
          .toList(),
      // children: <Widget>[
      //   MovieRow(
      //     item: MovieModel,
      //   ),
      //   MovieRow(),
      // ],
    );
  }
}

List<MovieModel> getMovies() {
  List<MovieModel> movies = new List<MovieModel>();

  for (var i = 0; i < 10; i++) {
    var movie = new MovieModel();
    movie.name = 'Movie' + i.toString();
    movies.add(movie);
  }

  return movies;
}

class MovieModel {
  String name = '';
}

class MovieRow extends StatelessWidget {
  MovieRow({this.item});

  final MovieModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {},
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExtendedImage(
              image: 'images/joker_fanart.jpg',
              width: 90,
              height: 110,
              borderRadius: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name),
                  Text('Ad'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

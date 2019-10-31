import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';
import 'package:movie_app/components/Carousel/CarouselImageFrame.dart';
import 'package:movie_app/components/Carousel/CarouselWithIndicator.dart';
import 'package:movie_app/components/Image/ExtendedImage.dart';
import 'package:movie_app/components/MovieList/MovieList.dart';
import 'package:movie_app/components/VoteStars.dart';
import 'package:movie_app/models/MovieModel.dart';

List<MovieModel> getMovies() {
  List<MovieModel> movies = new List<MovieModel>();

  for (var i = 0; i < 10; i++) {
    var movie = new MovieModel();
    movie.name = 'Movie' + i.toString();
    movie.tags.addAll(['Action', 'Comedy']);
    movies.add(movie);
  }

  return movies;
}

var movieList = getMovies();

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
          MovieList(movies: getMovies())
        ],
      ),
    );
  }
}

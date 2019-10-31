import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';
import 'package:movie_app/components/Image/ExtendedImage.dart';
import 'package:movie_app/components/VoteStars.dart';
import 'package:movie_app/models/MovieModel.dart';
import 'package:movie_app/screens/movie-details/MovieDetailScreen.dart';

class MovieList extends StatelessWidget {
  MovieList({this.movies});

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: movies
          .map((movie) => MovieRow(
                item: movie,
              ))
          .toList(),
    );
  }
}

class MovieRow extends StatelessWidget {
  MovieRow({this.item});

  final MovieModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: item,)),
        );
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExtendedImage(
                image: item.poster,
                width: 90,
                height: 110,
                borderRadius: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item.name, style: Styles.MovieListTitle),
                      VoteStars(vote: 3.2),
                      Text(item.tags.join(', '), style: Styles.SilencedText),
                      Text('1h 33min', style: Styles.SilencedText)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

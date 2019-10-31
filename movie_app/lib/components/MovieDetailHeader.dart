import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';
import 'package:movie_app/components/Image/ExtendedImage.dart';
import 'package:movie_app/components/VoteStars.dart';
import 'package:movie_app/models/MovieModel.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader({this.item});

  final MovieModel item;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExtendedImage(
            image: item.poster,
            width: 110,
            height: 150,
            borderRadius: 15,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name, style: Styles.MovieDetailHeaderTitle),
                  VoteStars(vote: 3.2),
                  Text(item.tags.join(', '), style: Styles.SilencedText),
                  Text('1h 33min', style: Styles.SilencedText),
                  Text('2019 - America', style: Styles.SilencedText)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

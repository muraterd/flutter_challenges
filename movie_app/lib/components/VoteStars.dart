import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class VoteStars extends StatelessWidget {
  VoteStars({this.vote = 0});

  final double vote;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (v) {},
          starCount: 5,
          rating: vote,
          size: 20,
          color: Color(0xFFF8BA00),
          borderColor: Color(0xFFF8BA00),
          spacing: 0.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            vote.toString(),
            style: Styles.SilencedText,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';
import 'package:movie_app/components/MovieDetailHeader.dart';
import 'package:movie_app/components/MovieList/MovieList.dart';
import 'package:movie_app/components/SectionTitle.dart';
import 'package:movie_app/models/MovieModel.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MovieDetailHeader(item: movie),
              SizedBox(
                height: 50,
              ),
              SectionTitle(title: 'Synopsis'),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam lacinia accumsan nulla, vitae commodo velit finibus vel. Duis molestie turpis sit amet semper pulvinar. Nam vulputate tristique consequat. Ut eu posuere eros, nec ultrices massa. Fusce sed maximus turpis. Integer suscipit pulvinar dui, vitae rhoncus massa mattis nec. Duis quis ipsum scelerisque sapien mattis consequat.',
                style: Styles.SilencedText,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';

class MainAppBar extends AppBar {
  MainAppBar()
      : super(
          elevation: 0,
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 60),
            indicatorColor: Color(0xFF274163),
            tabs: [
              Tab(text: 'Recommend'),
              Tab(text: 'Recent'),
              Tab(text: 'Popular'),
            ],
          ),
          title: Text(
            'Movies',
            style: Styles.AppBarTitle,
          ),
        );
}

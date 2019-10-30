import 'package:flutter/material.dart';
import 'package:movie_app/components/MainAppBar.dart';
import 'package:movie_app/screens/index/tabs/RecommendTab.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MainAppBar(),
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: TabBarView(
                children: [
                  // Tab(text: 'Recommend'),
                  RecommendTab(),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

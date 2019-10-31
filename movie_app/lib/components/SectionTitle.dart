import 'package:flutter/material.dart';
import 'package:movie_app/assets/Styles.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title, style: Styles.SectionTitle),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/assets/Palette.dart';

class Styles {
  static const AppBarTitle = TextStyle(
    color: Palette.Text,
    fontWeight: FontWeight.w900,
    fontSize: 26,
    letterSpacing: 2,
    fontStyle: FontStyle.italic,
  );

  static const MovieListTitle = TextStyle(
    color: Palette.Text,
    fontWeight: FontWeight.w800,
    fontSize: 15,
    letterSpacing: 1,
  );

  static const MovieDetailHeaderTitle = TextStyle(
    color: Palette.Text,
    fontWeight: FontWeight.w800,
    fontSize: 22,
    letterSpacing: 1,
  );

  static const SectionTitle = TextStyle(
    color: Palette.Text,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1,
  );

  static const SilencedText = TextStyle(
    color: Palette.SilencedText,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    letterSpacing: 1,
  );
}

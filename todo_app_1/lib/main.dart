import 'package:flutter/material.dart';
import 'package:todo_app/assets/Colors.dart';
import 'package:todo_app/screens/IndexScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: IndexScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Palette.Title,
          ),
        ),
      ),
    );
  }
}

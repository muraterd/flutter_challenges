import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  final List<Widget> children;

  CarouselWithIndicator({@required this.children});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        height: 300,
        aspectRatio: 2,
        viewportFraction: 1.0,
        items: widget.children,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(widget.children, (index, url) {
            return Container(
              width: 20.0,
              height: 4.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                color: _current == index
                    ? Color(0xFF274163)
                    : Color(0xFF274163).withOpacity(0.1),
              ),
            );
          }),
        ),
      )
    ]);
  }
}

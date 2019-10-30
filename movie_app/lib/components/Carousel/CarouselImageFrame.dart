import 'package:flutter/material.dart';
import 'package:movie_app/components/Image/ExtendedImage.dart';

class CarouselImageFrame extends StatelessWidget {
  const CarouselImageFrame({Key key, @required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 30),
      child: ExtendedImage(
        image: image,
        borderRadius: 20,
      ),
    );
  }
}

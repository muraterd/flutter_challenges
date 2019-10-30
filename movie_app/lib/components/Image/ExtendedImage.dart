import 'package:flutter/material.dart';

class ExtendedImage extends StatelessWidget {
  const ExtendedImage(
      {@required this.image, this.width, this.height, this.borderRadius = 0});

  final String image;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius:
                15.0, // has the effect of softening the shadow/ has the effect of extending the shadow
            offset: Offset(
              0.0, // horizontal, move right 10
              10.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
          width: width,
          height: height,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IconButtonParams {
  IconButtonParams({this.icon, this.size = 56, this.onPress});

  final double size;
  final Function onPress;
  final Icon icon;
}

class IconButton extends StatelessWidget {
  IconButton({
    this.params,
    Key key,
  }) : super(key: key);

  final IconButtonParams params;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: params.size,
      height: params.size,
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        child: params?.icon,
        onPressed: params?.onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(params.size / 2),
        ),
      ),
    );
  }
}

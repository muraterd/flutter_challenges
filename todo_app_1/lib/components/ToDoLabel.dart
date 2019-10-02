import 'package:flutter/material.dart';

class ToDoLabel extends StatelessWidget {
  const ToDoLabel({Key key, this.text, this.bgColor = const Color(0xFFFF5DB2)})
      : super(key: key);

  final String text;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}

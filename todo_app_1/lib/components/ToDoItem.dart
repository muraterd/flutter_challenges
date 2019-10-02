import 'package:flutter/material.dart';
import 'package:todo_app/models/ToDoItemModel.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key key, this.model, this.activeColor = Colors.pink})
      : super(key: key);

  final ToDoItemModel model;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: model.isCompleted,
          onChanged: (a) {},
          activeColor: activeColor,
        ),
        Text(model.text),
      ],
    );
  }
}

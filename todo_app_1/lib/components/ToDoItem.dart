import 'package:flutter/material.dart';
import 'package:todo_app/models/ToDoItemModel.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key key, this.model}) : super(key: key);

  final ToDoItemModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: model.isCompleted,
          onChanged: (a) {},
          activeColor: Colors.pink,
        ),
        Text(model.text),
      ],
    );
  }
}

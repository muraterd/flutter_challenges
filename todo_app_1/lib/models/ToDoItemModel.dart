import 'package:flutter/material.dart';

class ToDoItemModel {
  ToDoItemModel({this.text, this.isCompleted = false}) {
    id = UniqueKey().toString();
  }

  String id;
  String text = 'Test 1-2';
  bool isCompleted;
}

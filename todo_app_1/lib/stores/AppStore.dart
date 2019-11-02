import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_observable_state/flutter_observable_state.dart';
import 'package:todo_app/models/ToDoItemModel.dart';

const ListColors = [Color(0xFFFF5DB2), Color(0xFF1BCDAB)];

Color getRandomColor() {
  return ListColors[Random().nextInt(ListColors.length)];
}

class AppStore {
  List<TaskListStore> lists = [];

  AppStore() {
    lists.add(new TaskListStore('TO DO'));
    lists.add(new TaskListStore('PLACE TO GO'));
  }
}

class TaskListStore {
  var name = Observable('');
  var tasks = Observable(List<ToDoItemModel>());
  Color color = getRandomColor();

  TaskListStore(String name) {
    this.name.set(name);

    this.tasks.get().add(new ToDoItemModel(text: 'Test22', isCompleted: true));
  }

  addTask(ToDoItemModel task) {
    this.tasks.change((tasks) {
      tasks.add(task);
      return tasks;
    });
  }

  changeStatus(int index, bool newStatus) {
    this.tasks.change((tasks) {
      tasks[index].isCompleted = newStatus;
      return tasks;
    });
  }

  removeTask(int index) {
    this.tasks.change((tasks) {
      tasks.removeAt(index);
      return tasks;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_observable_state/flutter_observable_state.dart';
import 'package:todo_app/assets/Styles.dart';
import 'package:todo_app/components/ToDoList.dart';
import 'package:todo_app/stores/AppStore.dart';

final appStore = new AppStore();

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Title(
                    text: 'My Day',
                  ),
                  for (var i = 0; i < appStore.lists.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 15),
                      child: observe(
                          () => new ToDoList(taskListStore: appStore.lists[i])),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    this.text,
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120.0, left: 16, bottom: 30),
      child: Text(
        text,
        style: Styles.Title,
      ),
    );
  }
}

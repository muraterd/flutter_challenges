import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/assets/Styles.dart';
import 'package:todo_app/components/ToDoList.dart';
import 'package:todo_app/models/ToDoItemModel.dart';
import 'package:todo_app/stores/AppStore.dart';

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
                  Observer(
                    builder: (_) {
                      return new Title(
                        text: appStoreInstance.tasks.length.toString(),
                      );
                    },
                  ),
                  RaisedButton(
                    child: Text('Test'),
                    onPressed: () {
                      // appStoreInstance.changeName('name');
                      // appStoreInstance.setAsCompleted();
                      appStoreInstance.tasks.add(
                          ToDoItemModel(text: 'Deneme', isCompleted: true));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 15),
                    child: Observer(
                      builder: (_) => new ToDoList(
                        todoList: appStoreInstance.tasks,
                        title: 'TO DO',
                        color: Color(0xFFFF5DB2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 15),
                    child: new ToDoList(
                      todoList: [
                        ToDoItemModel(text: 'Deneme2', isCompleted: true)
                      ],
                      title: 'PLACE TO GO',
                      color: Color(0xFF1BCDAB),
                    ),
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

import 'package:flutter/material.dart';
import 'package:todo_app/Istanbay.dart';
import 'package:todo_app/Istanbay.dart' as IstanbayUI;
import 'package:todo_app/assets/Colors.dart';
import 'package:todo_app/assets/Styles.dart';
import 'package:todo_app/models/ToDoItemModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: IndexScreen(),
    );
  }
}

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
                  new Title(
                    text: 'My day',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 15),
                    child: new ToDoList(
                      todoList: [
                        ToDoItemModel(text: 'Deneme', isCompleted: false),
                        ToDoItemModel(text: 'Deneme22', isCompleted: true),
                      ],
                      label: ToDoLabel(
                        text: 'TO DO',
                        bgColor: Color(0xFFFF5DB2),
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
                      label: ToDoLabel(
                        text: 'PLACE TO GO',
                        bgColor: Color(0xFF1BCDAB),
                      ),
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

class ToDoList extends StatelessWidget {
  const ToDoList({Key key, @required this.label, this.todoList = const []})
      : super(key: key);

  final Widget label;
  final List<ToDoItemModel> todoList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Palette.Title.withOpacity(.2),
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  1.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
          ),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IstanbayUI.IconButton(
                    params: IconButtonParams(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Palette.Title.withOpacity(.5),
                      ),
                      onPress: () {},
                    ),
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'What to do next?',
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.pink,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.pink,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              for (var item in todoList)
                ToDoItem(
                  model: item,
                )
            ],
          ),
        ),
        label,
      ],
    );
  }
}

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

class ToDoLabel extends StatelessWidget {
  const ToDoLabel({Key key, this.text, this.bgColor = const Color(0xFFFF5DB2)})
      : super(key: key);

  final String text;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -10,
      left: 10,
      child: Container(
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

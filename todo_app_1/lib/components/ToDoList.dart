import 'package:flutter/material.dart';
import 'package:todo_app/assets/Colors.dart';
import 'package:todo_app/assets/Styles.dart';
import 'package:todo_app/components/ToDoItem.dart';
import 'package:todo_app/components/ToDoLabel.dart';
import 'package:todo_app/models/ToDoItemModel.dart';
import 'package:todo_app/Istanbay.dart' as IstanbayUI;
import 'package:todo_app/screens/AddTaskScreen.dart';

class ToDoList extends StatelessWidget {
  const ToDoList(
      {Key key,
      this.todoList = const [],
      this.color = Palette.Title,
      this.title})
      : super(key: key);

  final List<ToDoItemModel> todoList;
  final Color color;
  final String title;

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
                    params: IstanbayUI.IconButtonParams(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Palette.Title.withOpacity(.5),
                      ),
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTaskScreen(
                                    title: title,
                                    color: color,
                                  )),
                        );
                      },
                    ),
                  )
                ],
              ),
              for (var item in todoList)
                ToDoItem(
                  activeColor: color,
                  model: item,
                )
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 10,
          child: ToDoLabel(
            text: title ?? '',
            bgColor: color,
          ),
        )
      ],
    );
  }
}

void showNewPanel(context) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ToDoLabel(
                  text: 'TO DO',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Add Task',
                  style: Styles.Title,
                ),
                SizedBox(
                  height: 40,
                ),

                //sdfds
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
                )
              ],
            ),
          ),
        );
      });
}

import 'package:flutter/material.dart';
import 'package:flutter_observable_state/flutter_observable_state.dart';
import 'package:todo_app/assets/Colors.dart';
import 'package:todo_app/components/ToDoItem.dart';
import 'package:todo_app/components/ToDoLabel.dart';
import 'package:todo_app/Istanbay.dart' as IstanbayUI;
import 'package:todo_app/screens/AddTaskScreen.dart';
import 'package:todo_app/stores/AppStore.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key key, @required this.taskListStore}) : super(key: key);

  final TaskListStore taskListStore;

  renderRows() {
    List<Widget> rows = [];

    for (var i = 0; i < taskListStore.tasks.get().length; i++) {
      rows.add(Dismissible(
        background: Container(
          color: Colors.red,
        ),
        direction: DismissDirection.endToStart,
        key: Key(taskListStore.tasks.get()[i].id),
        onDismissed: (direction) {
          taskListStore.removeTask(i);
        },
        child: ToDoItem(
          activeColor: taskListStore.color,
          model: taskListStore.tasks.get()[i],
          onChanged: (isCompleted) {
            taskListStore.changeStatus(i, isCompleted);
          },
        ),
      ));
    }

    return rows;
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListHeader(taskListStore: taskListStore),
              observe(
                () => Column(children: renderRows()),
              )
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 10,
          child: observe(() => ToDoLabel(
                text: taskListStore.name.get() ?? '',
                bgColor: taskListStore.color,
              )),
        )
      ],
    );
  }
}

class ListHeader extends StatelessWidget {
  const ListHeader({
    Key key,
    @required this.taskListStore,
  }) : super(key: key);

  final TaskListStore taskListStore;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                          title: taskListStore.name.get(),
                          color: taskListStore.color,
                          taskListStore: taskListStore,
                        )),
              );
            },
          ),
        )
      ],
    );
  }
}

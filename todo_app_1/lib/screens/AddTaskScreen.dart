import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/assets/Styles.dart';
import 'package:todo_app/components/ToDoLabel.dart';
import 'package:todo_app/models/ToDoItemModel.dart';
import 'package:todo_app/stores/AppStore.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.title, this.color, @required this.taskListStore});

  final String title;
  final Color color;
  final TaskListStore taskListStore;
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ToDoLabel(
                text: title,
                bgColor: color,
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
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'What to do next?',
                  border: new OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: color,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xFF282A37),
                  child: Text('Add'),
                  onPressed: () {
                    taskListStore.addTask(
                        new ToDoItemModel(text: textEditingController.text));
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

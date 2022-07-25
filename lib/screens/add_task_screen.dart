import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  static TextEditingController taskText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff747474),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              controller: taskText,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskText.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

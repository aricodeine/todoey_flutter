import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {Key? key,
      required this.taskTitle,
      this.isChecked = false,
      required this.checkboxCallback,
      required this.longPressCallback})
      : super(key: key);

  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

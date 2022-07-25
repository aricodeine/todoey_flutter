import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ((context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              longPressCallback: () => taskData.deleteTask(index),
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool? checkboxNewState) {
                taskData.updateTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      }),
    );
  }
}

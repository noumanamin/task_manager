import 'package:flutter/material.dart';

import '../widgets/add_task_widget.dart';
import '../widgets/task_list_widget.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddTaskWidget(),
            Expanded(child: TaskListWidget()),
          ],
        ),
      ),
    );
  }
}

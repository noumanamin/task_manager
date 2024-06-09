import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';

class AddTaskWidget extends ConsumerWidget {
  final TextEditingController controller = TextEditingController();
  final uuid = Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: 'Task Title'),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.toString().trim().isEmpty) {
              return;
            }
            final task = Task(id: uuid.v4(), title: controller.text);
            ref.read(taskListProvider.notifier).addTask(task);
            controller.clear();
          },
          child: Text('Add Task'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
import '../providers/task_provider.dart';

class TaskItemWidget extends ConsumerWidget {
  final Task task;

  TaskItemWidget({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(task.title),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          ref.read(taskListProvider.notifier).deleteTask(task.id);
        },
      ),
    );
  }
}

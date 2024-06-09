import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/presentation/widgets/task_item_widget.dart';

import '../providers/task_provider.dart';

class TaskListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        return TaskItemWidget(task: taskList[index]);
      },
    );
  }
}

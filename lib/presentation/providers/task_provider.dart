import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/source/mock_task_data.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository_imp.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';

final mockDataSourceProvider = Provider((ref) => MockTaskData());
final taskRepositoryProvider = Provider((ref) => TaskRepositoryImpl(ref.read(mockDataSourceProvider)));

final getTasksProvider = Provider((ref) => GetTasks(ref.read(taskRepositoryProvider)));
final addTaskProvider = Provider((ref) => AddTask(ref.read(taskRepositoryProvider)));
final deleteTaskProvider = Provider((ref) => DeleteTask(ref.read(taskRepositoryProvider)));

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  final getTasks = ref.read(getTasksProvider);
  return TaskListNotifier(getTasks);
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  final GetTasks getTasks;

  TaskListNotifier(this.getTasks) : super([]) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    state = await getTasks();
  }

  void addTask(Task task) {
    state = [...state, task];
  }

  void deleteTask(String id) {
    state = state.where((task) => task.id != id).toList();
  }
}
import '../../data/repositories/task_repository.dart';
import '../../data/source/mock_task_data.dart';
import '../entities/task.dart';

class TaskRepositoryImpl implements TaskRepository {
  final MockTaskData dataSource;

  TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<Task>> getTasks() async {
    final taskModels = await dataSource.getTasks();
    return taskModels.map((taskModel) => taskModel.toEntity()).toList();
  }

  @override
  Future<void> addTask(Task task) async {
    await dataSource.addTask(task.title);
  }

  @override
  Future<void> deleteTask(String id) async {
    await dataSource.deleteTask(id);
  }
}

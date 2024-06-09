import 'package:task_manager/domain/entities/task.dart';
import 'package:uuid/uuid.dart';

import '../models/task_model.dart';

class MockTaskData {
  final List<TaskModel> tasks = [];
  final uuid = Uuid();

  Future<List<TaskModel>> getTasks() async {
    if (tasks.isEmpty) {
      List list = getJsonMap();
      for (int index = 0; index < list.length; index++) {
        var value = list[index];
        Task task = Task(id: value['id'], title: value['title']);
        TaskModel model = TaskModel.fromEntity(task);
        tasks.add(model);
      }
    }
    return tasks;
  }

  Future<void> addTask(String title) async {
    tasks.add(TaskModel(id: uuid.v4(), title: title));
  }

  Future<void> deleteTask(String id) async {
    tasks.removeWhere((task) => task.id == id);
  }

  getJsonMap() {
    return [
      {"id": "1", "title": "Complete Flutter project"},
      {"id": "2", "title": "Write unit tests"},
      {"id": "3", "title": "Review pull requests"},
      {"id": "4", "title": "Update documentation"},
      {"id": "5", "title": "Plan next sprint"},
      {"id": "6", "title": "Meet with the team"},
      {"id": "7", "title": "Deploy the new release"},
      {"id": "8", "title": "Fix critical bugs"},
      {"id": "9", "title": "Refactor codebase"},
      {"id": "10", "title": "Prepare presentation for stakeholders"}
    ];
  }
}

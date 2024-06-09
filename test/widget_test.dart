import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/usecases/add_task.dart';
import 'package:task_manager/domain/usecases/delete_task.dart';
import 'package:task_manager/domain/usecases/get_tasks.dart';
import 'package:task_manager/presentation/providers/task_provider.dart';

class MockGetTasks extends Mock implements GetTasks {}
class MockAddTask extends Mock implements AddTask {}
class MockDeleteTask extends Mock implements DeleteTask {}

void main() {
  group('TaskListNotifier', () {
    test('initial state is empty list', () {
      final getTasks = MockGetTasks();
      final notifier = TaskListNotifier(getTasks);

      expect(notifier.state, []);
    });

    test('loadTasks sets state to list of tasks', () async {
      final getTasks = MockGetTasks();
      when(getTasks()).thenAnswer((_) async => [Task(id: '1', title: 'Test Task')]);
      final notifier = TaskListNotifier(getTasks);

      await notifier.loadTasks();

      expect(notifier.state, [Task(id: '1', title: 'Test Task')]);
    });

    test('addTask adds a task to the state', () {
      final getTasks = MockGetTasks();
      final notifier = TaskListNotifier(getTasks);

      final task = Task(id: '1', title: 'New Task');
      notifier.addTask(task);

      expect(notifier.state, [task]);
    });

    test('deleteTask removes a task from the state', () {
      final getTasks = MockGetTasks();
      final notifier = TaskListNotifier(getTasks);

      final task = Task(id: '1', title: 'New Task');
      notifier.addTask(task);
      notifier.deleteTask('1');

      expect(notifier.state, []);
    });
  });
}
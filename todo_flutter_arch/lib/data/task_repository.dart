import 'task_model.dart';

abstract class TaskRepository {
  List<Task> getTask();
  Future<void> addTask(Task task);
  Future<void> toggleTask(String id);
}

class InMemoryTaskRepository implements TaskRepository {
  final List<Task> _tasks = [];
  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  List<Task> getTask() => List.unmodifiable(_tasks);

  @override
  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    print(index);
    if (index != -1) {
      final t = _tasks[index];
      print(t.title);
      print(t.completed);
      _tasks[index] = t.copyWith(completed: !t.completed);
      print(t.completed);
    }
  }
}

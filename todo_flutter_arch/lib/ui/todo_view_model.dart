import 'package:flutter/material.dart';
import 'package:todo_flutter_arch/application/add_task_command.dart';
import 'package:todo_flutter_arch/application/toogle_task_command.dart';
import 'package:todo_flutter_arch/data/task_repository.dart';

import '../application/results.dart';
import '../data/task_model.dart';

class TodoViewModel extends ChangeNotifier {
  final TaskRepository repository;
  List<Task> tasks = [];
  Result<void>? lastCommandResult;

  TodoViewModel(this.repository) {
    loadTasks();
  }

  void loadTasks() {
    tasks = repository.getTask();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    lastCommandResult = Result.isLoading();
    notifyListeners();

    final result = await AddTaskCommand(repository, title).call();

    lastCommandResult = result;

    if (result.isSuccess) loadTasks();
    notifyListeners();
  }

  Future<void> toogleTask(String id) async {
    print('chamadaaa');
    lastCommandResult = Result.isLoading();
    notifyListeners();

    final result = await ToogleTaskCommand(repository, id).call();
    if (result.isSuccess) loadTasks();
    notifyListeners();
  }
}

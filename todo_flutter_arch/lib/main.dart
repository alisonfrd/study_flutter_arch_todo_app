import 'package:flutter/material.dart';

import 'data/task_repository.dart';
import 'ui/todo_page.dart';
import 'ui/todo_view_model.dart';

void main() {
  final repository = InMemoryTaskRepository();
  final viewModel = TodoViewModel(repository);

  runApp(MaterialApp(home: TodoPage(viewModel: viewModel)));
}

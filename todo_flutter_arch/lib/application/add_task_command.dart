import 'package:todo_flutter_arch/application/commands.dart';
import 'package:todo_flutter_arch/application/results.dart';
import 'package:todo_flutter_arch/data/task_model.dart';
import 'package:todo_flutter_arch/data/task_repository.dart';
import 'package:uuid/uuid.dart';

class AddTaskCommand extends Command<void> {
  final TaskRepository _repository;
  final String _title;

  AddTaskCommand(this._repository, this._title);

  @override
  Future<Result<void>> call() async {
    try {
      await _repository.addTask(Task(id: const Uuid().v4(), title: _title));
      return Result.success(null);
    } catch (e) {
      return Result.error(e);
    }
  }
}

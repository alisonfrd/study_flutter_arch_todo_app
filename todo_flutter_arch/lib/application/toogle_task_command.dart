import 'package:todo_flutter_arch/application/commands.dart';
import 'package:todo_flutter_arch/application/results.dart';
import 'package:todo_flutter_arch/data/task_repository.dart';

class ToogleTaskCommand extends Command<void> {
  final TaskRepository repository;
  final String id;

  ToogleTaskCommand(this.repository, this.id);

  @override
  Future<Result<void>> call() async {
    try {
      await repository.toggleTask(id);
      print('ToogleTaskCommand');
      return Result.success(null);
    } catch (e) {
      print('$e');

      return Result.error(e);
    }
  }
}

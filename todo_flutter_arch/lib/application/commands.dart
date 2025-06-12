import 'package:todo_flutter_arch/application/results.dart';

abstract class Command<T> {
  Future<Result<T>> call();
}

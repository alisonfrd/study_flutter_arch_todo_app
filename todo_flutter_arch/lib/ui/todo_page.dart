import 'package:flutter/material.dart';
import 'todo_view_model.dart';

class TodoPage extends StatefulWidget {
  final TodoViewModel viewModel;
  const TodoPage({required this.viewModel, super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onModelChanged);
  }

  void _onModelChanged() => setState(() {});

  @override
  void dispose() {
    widget.viewModel.removeListener(_onModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    return Scaffold(
      appBar: AppBar(title: const Text("Tarefas")),
      body: Column(
        children: [
          if (vm.lastCommandResult?.isError ?? false)
            Text(
              'Erro: ${vm.lastCommandResult?.error}',
              style: const TextStyle(color: Colors.red),
            ),
          Expanded(
            child: ListView(
              children: vm.tasks
                  .map(
                    (t) => ListTile(
                      title: Text(
                        t.title,
                        style: TextStyle(
                          decoration: t.completed
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: t.completed,
                        onChanged: (_) => vm.toogleTask(t.id),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Nova tarefa'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = _controller.text.trim();
                    if (title.isNotEmpty) {
                      vm.addTask(title);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  TodoTile(
      {required this.todo, required this.onToggle, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (_) => onToggle(),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}

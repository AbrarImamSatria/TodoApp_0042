import 'package:flutter/material.dart';

class TodoAppPage extends StatefulWidget {
  const TodoAppPage({super.key});

  @override
  State<TodoAppPage> createState() => _TodoAppPageState();
}

class Task {
  final String name;
  final DateTime deadline;
  bool isDone;
  Task({required this.name, required this.deadline, this.isDone = false});
}

class _TodoAppPageState extends State<TodoAppPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

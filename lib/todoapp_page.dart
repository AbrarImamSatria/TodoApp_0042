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
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDateTime;
  final List<Task> _tasks = [];
  final _formKey = GlobalKey<FormState>();
  bool _showDateValidationError = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // Build method akan ditambahkan nanti
    return Scaffold();
  }
}

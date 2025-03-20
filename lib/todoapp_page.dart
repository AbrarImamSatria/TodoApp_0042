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

  void _addTask() {
  if (_selectedDateTime == null) {
    setState(() {
      _showDateValidationError = true;
    });
  }

  if (_formKey.currentState!.validate() && _selectedDateTime != null) {
    setState(() {
      _tasks.add(
        Task(
          name: _nameController.text,
          deadline: _selectedDateTime!,
          isDone: false,
        ),
      );
      _nameController.clear();
      _selectedDateTime = null;
      _showDateValidationError = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        'Task added successfully',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.all(16),
      elevation: 6,
      duration: const Duration(seconds: 2),
    ),
  );
  }
}

void _toggleTaskStatus(int index) {
  setState(() {
    _tasks[index].isDone = !_tasks[index].isDone;
  });
}
  
  @override
  Widget build(BuildContext context) {
    // Build method akan ditambahkan nanti
    return Scaffold();
  }
}

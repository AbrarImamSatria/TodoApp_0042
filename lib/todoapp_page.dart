import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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

  void _dateTimePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        final now = DateTime.now();
        final initialDateTime = _selectedDateTime ?? now;

        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Set Task Date & Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  CupertinoButton(
                    child: const Text('Select'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const Divider(height: 0, thickness: 1),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: initialDateTime,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      _selectedDateTime = newDateTime;
                      _showDateValidationError = false;
                    });
                  },
                  use24hFormat: false,
                  minuteInterval: 1,
                  mode: CupertinoDatePickerMode.dateAndTime,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Form Page'))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}

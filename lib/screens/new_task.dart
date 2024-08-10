import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/task_provider.dart';
import 'package:provider/provider.dart';


class NewTask extends StatefulWidget {
  NewTask({super.key});

  @override
  State<NewTask> createState() {
    return _NewTask();
  }
}

class _NewTask extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _date = DateTime.now();

  void onDate() async {
    var selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    setState(() {
      _date = selectedDate!;
    });
  }

  void closeDialog() {
    Navigator.pop(context);
  }

  void onSave(context) {
    bool dataIsNotCorrect =
        _titleController.text.isEmpty || _descriptionController.text.isEmpty;

    if (dataIsNotCorrect) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          actions: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('All text fields need to be filled'),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(onPressed: closeDialog, child: Text('close')),
                ],
              ),
            ),
          ],
        ),
      );
      return;
    }

    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    taskProvider.addTasks(Task(
      title: _titleController.text,
      description: _descriptionController.text,
      dateToFinish:
          '${_date.day < 10 ? '0${_date.day}' : _date.day}/${_date.month < 10 ? '0${_date.month}' : _date.month}/${_date.year}',
    ),);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: onDate,
                  icon: const Icon(
                    Icons.date_range_rounded,
                  )),
              Spacer(),
              TextButton(onPressed: closeDialog, child: const Text('Cancel')),
              ElevatedButton(
                onPressed: (){onSave(context);},
                child: const Text('Save'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

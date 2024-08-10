import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/reposotiries/task_repository.dart';
import 'package:todo_list/screens/display_tasks.dart';
import 'package:todo_list/screens/new_task.dart';
import 'package:todo_list/model/task.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context)  {
     void onNewTask() {
      showModalBottomSheet(
        context: context,
        builder: (context) => NewTask(),
    );
  }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post-it'),
        actions: [
          IconButton(
            onPressed: onNewTask,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DisplayTasks(),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}

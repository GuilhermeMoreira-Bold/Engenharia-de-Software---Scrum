import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/providers/task_provider.dart';
import 'package:todo_list/reposotiries/task_repository.dart';

class DisplayTasks extends StatelessWidget {
  DisplayTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context,listen: true);

    print('tasks:${taskProvider.tasks}');
    return Column(
              children: [
                ...taskProvider.tasks.map(
                  (data) => Card(
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(data.title),
                              Spacer(),
                              Text(data.dateToFinish),
                            ],
                          ),
                          Text(data.description)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
  }
}
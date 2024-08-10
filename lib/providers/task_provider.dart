import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/reposotiries/task_repository.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> _tasks = [];
  List<Task> get tasks =>  _tasks;


  final TaskRepository _taskRepository = TaskRepository();

  TaskProvider(){
    _loadTask();
  }



  Future<void> _loadTask() async{
    _tasks = await _taskRepository.getTasks();
    notifyListeners();
  }

  Future<void> addTasks(Task task) async{
    await _taskRepository.insertTask(task);
    _loadTask();
    notifyListeners();
  }

}
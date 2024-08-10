import 'package:todo_list/database/database_helper.dart';
import 'package:todo_list/model/task.dart';

class TaskRepository{
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int> insertTask(Task task) async {
    final db = await _databaseHelper.database;
    return await db.insert('task', task.toMap());
  }

  Future<List<Task>> getTasks() async{
    final db = await _databaseHelper.database;
    final List<Map<String,dynamic>> maps = await db.query('task');

    return await List.generate(maps.length, (i){
      return Task.fromMap(maps[i]);
    });

  }

  
}
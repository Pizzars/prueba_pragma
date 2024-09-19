import 'package:prueba_data_center/domain/models/task_model.dart';
import 'package:prueba_data_center/repositories/tasks_repository.dart';

import '../../domain/database/inlaze_db.dart';

class TasksPresenter {

  final inlazeDB = InlazeDB();
  final repository = TasksRepository();

  Future<List<TaskModel>> getTasks() async{
    try{
      // final list = repository.getTasks();
      final list = await inlazeDB.getAllTasks();
      return list;
    }
    catch(e) {
      throw Exception(e);
    }
  }

  Future<bool> deleteTask(int id) async{
    try {
      await inlazeDB.deleteTask(id);
      return true;
    }
    catch(e) {
      throw Exception(e);
    }
  }

  Future<int> createTask(String name) async{
    try{
        return await inlazeDB.createTask(name: name);
    }
    catch(e) {
      throw Exception(e);
    }
  }

  Future<bool> updateTask(int id, bool state) async{
    try{
        await inlazeDB.updateTask(id: id, checked: state);
        return true;
    }
    catch(e) {
      throw Exception(e);
    }
  }

}
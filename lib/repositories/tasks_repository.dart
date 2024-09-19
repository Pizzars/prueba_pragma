import 'package:prueba_data_center/domain/models/task_model.dart';

import '../services/api_service.dart';

class TasksRepository {

  final _service = ApiService();

  Future<List<TaskModel>> getTasks() async{
    final response = await _service.getData("new");

    final tasksRes = response["tasks"];

    if(tasksRes == null) throw("Error al traer los datos");

    final list = TaskModel.fromListMap(tasksRes);

    return list;
  }

  Future<List<TaskModel>> findTasks(String search) async{
    final response = await _service.getData("task/$search");

    final tasksRes = response["tasks"];

    if(tasksRes == null) throw("Error al traer los datos");

    final list = TaskModel.fromListMap(tasksRes);

    return list;
  }

}
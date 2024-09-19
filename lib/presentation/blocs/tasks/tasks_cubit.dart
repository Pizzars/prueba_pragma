import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_data_center/domain/models/task_model.dart';
import 'package:prueba_data_center/domain/models/search_model.dart';

import '../../../presenters/tasks/tasks_presenter.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {

  final _presenter = TasksPresenter();

  TasksCubit({
    bool darkMode = false
  }) : super( const TasksState());

  void setError(String? error, {bool reset = false}){
    emit (state.copyWith(error: error, resetError: reset));
  }

  void setSearch(String? search){
    emit (state.copyWith(search: search));
  }

  void resetSearch(){
    emit (state.copyWith(search: null, tasks: null, searchReset: true));
  }

  void getTasks() async {

    emit (state.copyWith(load: true));

    try{
      final tasks = await _presenter.getTasks();
      emit (state.copyWith(load: false, tasks: tasks));
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void createTask(String name) async {
    emit (state.copyWith(load: true));

    try{
      final id = await _presenter.createTask(name);
      final newTask = TaskModel(id: id, name: name, checked: false);
      final List<TaskModel> newList = [];
      newList.addAll(state.tasks ?? []);
      newList.add(newTask);
      emit (state.copyWith(load: false, tasks: newList));
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void deleteTask(int id) async {
    emit (state.copyWith(load: true));

    try{
      await _presenter.deleteTask(id);
      getTasks();
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void updateTask(int id, bool checked) async {

    try{
      await _presenter.updateTask(id, checked);
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void getInitialData() async {
    getTasks();
  }
}
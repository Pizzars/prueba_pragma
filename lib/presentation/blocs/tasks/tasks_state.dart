part of 'tasks_cubit.dart';

class TasksState extends Equatable {
  final bool load;
  final String? error;
  final List<TaskModel>? tasks;
  final String? search;

  const TasksState({this.load = false, this.error, this.tasks, this.search});

  @override
  List<Object?> get props => [ load, error, tasks, search ];

  TasksState copyWith({
    bool? load,
    String? error,
    List<TaskModel>? tasks,
    List<TaskModel>? news,
    List<SearchModel>? searches,
    String? search,
    bool searchReset = false,
    bool resetError = false,
  }){
    return TasksState(
      load: load ?? this.load,
      error: resetError ? null : error ?? this.error,
      tasks: searchReset ? null : tasks ?? this.tasks,
      search: searchReset ? null : search ?? this.search,
    );
  }

}
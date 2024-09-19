import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_data_center/presentation/screens/home/widgets/task_item.dart';

import '../../../blocs/tasks/tasks_cubit.dart';

class TasksView extends StatefulWidget {
  const TasksView({Key? key}) : super(key: key);

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state){
          final tasks = state.tasks ?? [];
          return Padding(
            padding: const EdgeInsets.only(top: 0),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (_, index) {
                final task = tasks[index];
                return TaskItem(task: task);
              },
            ),
          );
        }
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_data_center/config/config.dart';
import 'package:prueba_data_center/domain/models/task_model.dart';
import 'package:prueba_data_center/presentation/screens/widgets/texts/title_small_app.dart';

import '../../../blocs/tasks/tasks_cubit.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task});

  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool checked = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      checked = widget.task.checked;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.task.id.toString()),
      background: Container(color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(bottom: 5),
        child: const TitleSmall(text: "Eliminar", color: ColorsApp.tertiary,),
      ),
      onDismissed: (_) {
        context.read<TasksCubit>().deleteTask(widget.task.id);
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorsApp.tertiary,
            border: Border.all(width: 1, color: ColorsApp.primary)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: TitleSmall(text: widget.task.name)),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: checked ? ColorsApp.primary : ColorsApp.tertiary,
                border: Border.all(width: 1, color: ColorsApp.primary),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: (){
                  context.read<TasksCubit>().updateTask(widget.task.id, !checked);
                  setState(() {
                    checked = !checked;
                  });
                },
                child: const Center(
                  child: Text("✓", style: TextStyle(color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

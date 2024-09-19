import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_data_center/presentation/screens/widgets/buttons/button_app.dart';
import 'package:prueba_data_center/presentation/screens/widgets/input_container.dart';
import 'package:prueba_data_center/presentation/screens/widgets/texts/TextApp.dart';
import 'package:prueba_data_center/presentation/screens/widgets/texts/title_medium_app.dart';

import '../../../blocs/tasks/tasks_cubit.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: TitleMedium(text: "Crear tarea",)),
      content: Container(
        height: 130,
        child: Column(
          children: [
            const TextApp(text: "Ingresa el nombre de la tarea"),
            InputContainer(
              label: "Hacer mercado",
              hintText: "Hacer mercado",
              controller: controller,
              onSearch: (_){},
            ),
            ButtonApp(text: "Crear tarea", onPressed: () {
              if(controller.text.isNotEmpty && controller.text.length > 2) {
                context.read<TasksCubit>().createTask(controller.text);
                Navigator.pop(context);
              }
            })
          ],
        ),
      ),
    );
  }
}

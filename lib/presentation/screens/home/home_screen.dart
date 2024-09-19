import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_data_center/config/config.dart';
import 'package:prueba_data_center/presentation/blocs/blocs.dart';
import 'package:prueba_data_center/presentation/blocs/tasks/tasks_cubit.dart';
import 'package:prueba_data_center/presentation/screens/home/widgets/create_task_view.dart';
import 'package:prueba_data_center/presentation/screens/home/widgets/tasks_view.dart';
import 'package:prueba_data_center/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_data_center/presentation/screens/widgets/space_app.dart';
import 'package:prueba_data_center/presentation/screens/widgets/texts/title_small_app.dart';

import '../../../config/helpers/hero_tags.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.tertiary,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SpaceApp(horizontal: true, space: 4,),
              Hero(
                tag: HeroTags.logo,
                child: SizedBox(
                  width: 120,
                  child: Image.asset(
                    'assets/images/general/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: TextButton(
                  onPressed: (){
                    showDialog(context: context, builder: (_) {
                      return const CreateTaskView();
                    });
                  },
                  style: TextButton.styleFrom(padding: PaddingApp.zero),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Icon(Icons.add, color: ColorsApp.textColor ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: ColorsApp.tertiary,
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {

    Future<bool> callData() async {
      context.read<TasksCubit>().getInitialData();
      return true;
    }

    return BaseScreen(
      child: FutureBuilder(
        future: callData(),
        builder: (_, __) {
          return BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state){
              getView(){
                if(state.load){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // if(state.error != null){
                //   return Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Icon(Icons.search_off, color: ColorsApp.primary, size: 50,),
                //       const SpaceApp(space: 2,),
                //       TitleSmall(text: state.error!),
                //       const SpaceApp(space: 2,),
                //       ButtonApp(text: "Volver a intentar", onPressed: (){
                //         context.read<BooksCubit>().setError(null, reset: true);
                //       })
                //     ],
                //   );
                // }
                final tasks = state.tasks ?? [];
                if(tasks.isEmpty){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.search_off, color: ColorsApp.primary, size: 50,),
                      SpaceApp(space: 2,),
                      TitleSmall(text: "No encontramos resultados", color: ColorsApp.primary,)
                    ],
                  );
                }

                return const TasksView();
              }

              return Column(
                children: [
                  Expanded(child: getView() ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
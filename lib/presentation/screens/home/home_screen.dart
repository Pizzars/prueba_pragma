import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/config/config.dart';
import 'package:prueba_pragma/presentation/blocs/blocs.dart';
import 'package:prueba_pragma/presentation/screens/home/widgets/cats_view.dart';
import 'package:prueba_pragma/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_pragma/presentation/screens/widgets/buttons/button_app.dart';
import 'package:prueba_pragma/presentation/screens/widgets/space_app.dart';
import 'package:prueba_pragma/presentation/screens/widgets/texts/title_small_app.dart';

import '../../../config/helpers/hero_tags.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primary300,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
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
              const SizedBox(
                width: 40,
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
      context.read<CatsCubit>().getInitialData();
      return true;
    }

    return BaseScreen(
      child: FutureBuilder(
        future: callData(),
        builder: (_, __) {
          return BlocBuilder<CatsCubit, CatsState>(
            builder: (context, state){
              getView(){
                if(state.load){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state.error != null){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search_off, color: ColorsApp.primary, size: 50,),
                      const SpaceApp(space: 2,),
                      TitleSmall(text: state.error!),
                      const SpaceApp(space: 2,),
                      ButtonApp(text: "Volver a intentar", onPressed: (){
                        context.read<CatsCubit>().setError(null, reset: true);
                      })
                    ],
                  );
                }
                final tasks = state.cats ?? [];
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

                return const CatsView();
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
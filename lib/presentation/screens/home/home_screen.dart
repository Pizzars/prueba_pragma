import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_inlaze/config/config.dart';
import 'package:prueba_inlaze/presentation/blocs/blocs.dart';
import 'package:prueba_inlaze/presentation/screens/home/widgets/books_view.dart';
import 'package:prueba_inlaze/presentation/screens/home/widgets/search_view.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/base_screen.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/buttons/button_app.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/space_app.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/texts/TextApp.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/texts/title_small_app.dart';

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
                    context.read<LoginCubit>().signOut();
                  },
                  style: TextButton.styleFrom(padding: PaddingApp.zero),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Icon(Icons.exit_to_app, color: ColorsApp.textColor ),
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
      context.read<BooksCubit>().getInitialData();
      return true;
    }

    return BaseScreen(
      child: FutureBuilder(
        future: callData(),
        builder: (_, __) {
          return BlocBuilder<BooksCubit, BooksState>(
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
                        context.read<BooksCubit>().setError(null, reset: true);
                      })
                    ],
                  );
                }
                final books = state.books ?? state.news ?? [];
                if(books.isEmpty){
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

                return const BooksView();
              }

              return Column(
                children: [
                  Hero(
                    tag: HeroTags.search,
                    child: TextButton(
                      style: TextButton.styleFrom(padding: PaddingApp.zero),
                      onPressed: (){
                        showDialog(context: context, builder: (_){
                          return const SearchView();
                        });
                      },
                      child: Container(
                        padding: PaddingApp.widget,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusApp.widget,
                          color: ColorsApp.textColor.withOpacity(0.3),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextApp(text: state.search ?? "Buscar"),
                            const Icon(Icons.search, color: ColorsApp.textColor, size: 16,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(child: getView() ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
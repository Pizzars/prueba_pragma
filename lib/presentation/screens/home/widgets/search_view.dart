import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_data_center/presentation/blocs/blocs.dart';
import 'package:prueba_data_center/presentation/screens/widgets/buttons/button_app.dart';
import 'package:prueba_data_center/presentation/screens/widgets/space_app.dart';
import 'package:prueba_data_center/presentation/screens/widgets/texts/title_small_app.dart';

import '../../../../config/helpers/hero_tags.dart';
import '../../../../config/helpers/styles_app.dart';
import '../../widgets/input_container.dart';

class SearchView extends StatelessWidget {
  const SearchView ({super.key});

  @override
  Widget build(BuildContext context) {

    final booksCubit = context.watch<BooksCubit>();
    final TextEditingController search = TextEditingController(text: booksCubit.state.search ?? "");

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorsApp.tertiary.withOpacity(0.8),
            child: Column(
              children: [
                const SpaceApp(space: 2,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(padding: PaddingApp.zero),
                        onPressed: (){
                          booksCubit.resetSearch();
                          context.pop();
                        },
                        child: const Icon(Icons.chevron_left, color: ColorsApp.primary,)
                    ),
                    Flexible(
                      child: Hero(
                      tag: HeroTags.search,
                      child: InputContainer(
                        label: "Buscar",
                        hintText: "Buscar",
                        search: true,
                        controller: search,
                        onSearch: (_){
                          if(search.text.isNotEmpty && search.text.length > 2) {
                            booksCubit.findBooks(search.text);
                            context.pop();
                          }
                        },
                      ),
                    ),
                    ),
                    TextButton(
                        style: TextButton.styleFrom(padding: PaddingApp.zero),
                        onPressed: (){
                          booksCubit.resetSearch();
                          context.pop();
                        },
                        child: const Icon(Icons.delete, color: ColorsApp.primary,)
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: PaddingApp.screen,
                    child: SingleChildScrollView(
                      child: Column(
                        children: booksCubit.state.searches == null ? [] : booksCubit.state.searches!.reversed.map((e) => TextButton(
                          style: TextButton.styleFrom(padding: PaddingApp.zero),
                          onPressed: (){
                            booksCubit.findBooks(e.search);
                            context.pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
                            margin: const EdgeInsets.only(top: 5),
                            width: double.infinity,
                            color: ColorsApp.textColor.withOpacity(0.3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TitleSmall(
                                  text: e.search,
                                ),
                                const Icon(Icons.history, color: Colors.white,)
                              ],
                            ),
                          ),
                        )).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

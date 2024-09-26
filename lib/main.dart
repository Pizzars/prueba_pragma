import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/presentation/blocs/blocs.dart';
import 'package:prueba_pragma/presentation/blocs/service_locator.dart';

import 'config/theme/app_theme.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<RouterSimpleCubit>(),),
        BlocProvider(create: (context) => getIt<ThemeCubit>(),),
        BlocProvider(create: (context) => getIt<CatsCubit>(),),
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.read<RouterSimpleCubit>().state;
    final themeCubit = context.watch<ThemeCubit>();

    return MaterialApp.router(
      title: 'Prueba Inlaze',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: themeCubit.state.isDarkmode ).getTheme(),
    );
  }
}
import 'package:get_it/get_it.dart';
import 'package:prueba_pragma/presentation/blocs/blocs.dart';
import 'package:prueba_pragma/presentation/blocs/cats/cats_cubit.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton( ThemeCubit() );
  getIt.registerSingleton( RouterSimpleCubit() );
  getIt.registerSingleton( CatsCubit() );
}
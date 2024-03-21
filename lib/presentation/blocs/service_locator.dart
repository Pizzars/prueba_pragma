import 'package:get_it/get_it.dart';
import 'package:prueba_inlaze/presentation/blocs/blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton( ThemeCubit() );
  getIt.registerSingleton( RouterSimpleCubit() );
  getIt.registerSingleton( SignupCubit() );
  getIt.registerSingleton( LoginCubit() );
  getIt.registerSingleton( BooksCubit() );
}
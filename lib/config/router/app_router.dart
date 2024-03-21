import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_inlaze/presentation/screens/auth/signup_screen.dart';
import 'package:prueba_inlaze/presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/screens.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';

  static const String two = '/cubit-router';
  static const String three = '/cubit-state';
  static const String four = '/guest-bloc';
  static const String five = '/pokemon-bloc';
  static const String siz = '/blocs-with-blocs';
}

final _appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const SignUpScreen(),
    ),

    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),

    //
    // GoRoute(
    //   path: '/simple-cubit',
    //   builder: (context, state) => const CubitScreen(),
    // ),
    //
    // GoRoute(
    //   path: '/cubit-router',
    //   builder: (context, state) => const RouterScreen(),
    // ),
    //
    // GoRoute(
    //   path: '/cubit-state',
    //   builder: (context, state) => const MultipleCubitScreen(),
    // ),
    //
    // GoRoute(
    //   path: '/guest-bloc',
    //   builder: (context, state) => const GuestsScreen(),
    // ),
    //
    // GoRoute(
    //   path: '/pokemon-bloc',
    //   builder: (context, state) => const PokemonScreen(),
    // ),
    //
    // GoRoute(
    //   path: '/blocs-with-blocs',
    //   builder: (context, state) => const BlocsWithBlocsScreen(),
    // ),
  ],
);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit():super(_appRouter);

  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go(Routes.home);
  }

  void goToScreen(String route) {
    state.go(route);
  }

  void replaceScreen(String route) {
    state.replace(route);
  }
}
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_data_center/data/user_preferences.dart';
import 'package:prueba_data_center/domain/models/user_model.dart';
import 'package:prueba_data_center/presenters/auth/login_presenter.dart';

import '../../../config/router/app_router.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  final _presenter = LoginPresenter();

  LoginCubit({
    bool darkMode = false
  }) : super( const LoginState());

  void setError(String error){
    emit (LoginState(error: error));
  }

  void login({required String user, required String password}) async {
    emit (const LoginState(load: true));

    try{
      final userDB = await _presenter.login(user: user, password: password);
      emit (LoginState(load: false, user: userDB));
      await setMyUserPreferences(userDB);
      GetIt.I<RouterSimpleCubit>().replaceScreen(Routes.home);
    }
    catch(e) {
      emit (LoginState(load: false, error: e.toString()));
    }

  }

  void signOut() async {
    emit (const LoginState(load: true));

    try{
      emit (const LoginState(load: false, user: null));
      await setMyUserPreferences(null);
      GetIt.I<RouterSimpleCubit>().replaceScreen(Routes.login);
    }
    catch(e) {
      emit (LoginState(load: false, error: e.toString()));
    }
  }

}
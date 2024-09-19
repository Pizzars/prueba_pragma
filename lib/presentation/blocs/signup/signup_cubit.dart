import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba_data_center/config/config.dart';
import 'package:prueba_data_center/presenters/auth/signup_presenter.dart';

import '../../../data/user_preferences.dart';
import '../../../domain/models/user_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {

  final _presenter = SignupPresenter();

  SignupCubit({
    bool darkMode = false
  }) : super(const SignupState());

  void setError(String error){
    emit (SignupState(error: error));
  }

  void createUser({required String name, required String user, required String password}) async {
    emit (const SignupState(load: true));

    try{
      final userDB = await _presenter.createUser(name: name, user: user, password: password);
      emit (SignupState(load: false, user: userDB));
      await setMyUserPreferences(userDB);
      GetIt.I<RouterSimpleCubit>().goBack();
      GetIt.I<RouterSimpleCubit>().replaceScreen(Routes.home);
    }
    catch(e) {
      emit (SignupState(load: false, error: e.toString()));
    }

  }

}
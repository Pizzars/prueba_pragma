import 'package:prueba_inlaze/domain/models/user_model.dart';

import '../../domain/database/inlaze_db.dart';

class LoginPresenter {

  final inlazeDB = InlazeDB();

  Future<UserModel> login({required String user, required String password}) async {

    try{
      final userVerification = await inlazeDB.getUserByUsername(user: user);
      if(userVerification == null) throw("El usuario no existe");

      final userDB = await inlazeDB.getUserLogin(user: user, password: password);
      if(userDB == null) throw Exception("Contraseña incorrecta");
      return userDB;
    }
    catch(e) {
      throw Exception(e);
    }

  }

}
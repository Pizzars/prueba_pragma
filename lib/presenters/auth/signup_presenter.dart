import 'package:prueba_data_center/domain/models/user_model.dart';

import '../../domain/database/inlaze_db.dart';

class SignupPresenter {

  final inlazeDB = InlazeDB();

  Future<UserModel> createUser({required String name, required String user, required String password}) async {

    try{
      final userVerification = await inlazeDB.getUserByUsername(user: user);

      if(userVerification != null) throw("El usuario ya existe");

      final id = await inlazeDB.createUser(name: name, user: user, password: password);
      final userDB = await inlazeDB.getUserById(id: id);
      if(userDB == null) throw Exception("Error al crear el usuario");
      return userDB;
    }
    catch(e) {
      throw Exception(e);
    }

  }

}
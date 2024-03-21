
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/user_model.dart';

Future<bool> getTourPreference () async{
  final prefs = await SharedPreferences.getInstance();
  final bool tour = prefs.getBool("tour") ?? false;
  return tour;
}
Future<bool> setTourPreference (bool value) async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("tour", value);
  return true;
}

Future<UserModel?> getUserPreferences () async{
  final prefs = await SharedPreferences.getInstance();
  final String userPref = prefs.getString("myUser") ?? "";
  try {
    if(userPref.isEmpty){
      return null;
    }
    Map<String, dynamic> map = json.decode(userPref);
    return UserModel.fromSql(map);
  }
  catch(e){
    print(e);
    return null;
  }
}

Future<String> setMyUserPreferences (UserModel? user) async{
  final prefs = await SharedPreferences.getInstance();
  if(user == null) {
    prefs.setString("myUser", "");
    return "";
  }
  final value = json.encode(user.toMap());
  prefs.setString("myUser", value);
  return value;
}


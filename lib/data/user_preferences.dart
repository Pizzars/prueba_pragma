
import 'package:shared_preferences/shared_preferences.dart';

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

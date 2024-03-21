import 'dart:io';

Future<bool> checkConnection() async {
  try{
    final result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty){
      return true;
    }
    else {
      throw("SIN CONEXIÓN A INTERNET");
    }
  }
  catch(e) {
    throw("SIN CONEXIÓN A INTERNET");
  }
}


import 'package:dio/dio.dart';
import 'package:prueba_pragma/services/connectivity.dart';

class ApiService {

  static const path = "https://api.thecatapi.com/v1/";
  static const apiKey = "live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr";

  final Dio _dio = Dio();

  String setApiKey(bool addApiKey) {
    if(addApiKey) {
      return 'api_key=$apiKey';
    }
    return '';
  }

  Future<dynamic> getData(String route, {bool addApiKey = false}) async {
    try {
      await checkConnection();
      // Realiza la solicitud GET
      Response response = await _dio.get('$path$route${setApiKey(addApiKey)}');

      // Verifica si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // La solicitud fue exitosa, puedes acceder a los datos de la respuesta
        return response.data;
      } else {
        // La solicitud no fue exitosa, maneja el error según sea necesario
        throw Exception("Error al traer los datos");
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

}
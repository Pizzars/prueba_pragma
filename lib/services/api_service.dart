import 'package:dio/dio.dart';
import 'package:prueba_data_center/services/connectivity.dart';

class ApiService {

  static const path = "https://api.itbook.store/1.0/";

  final Dio _dio = Dio();

  Future<dynamic> getData(String route) async {
    try {
      await checkConnection();
      // Realiza la solicitud GET
      Response response = await _dio.get('$path$route');

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
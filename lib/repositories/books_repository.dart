import 'package:prueba_inlaze/domain/models/book_model.dart';

import '../services/api_service.dart';

class BooksRepository {

  final _service = ApiService();

  Future<List<BookModel>> getNews() async{
    final response = await _service.getData("new");

    final booksRes = response["books"];

    if(booksRes == null) throw("Error al traer los datos");

    final list = BookModel.fromListMap(booksRes);

    return list;
  }

  Future<List<BookModel>> findBooks(String search) async{
    final response = await _service.getData("search/$search");

    final booksRes = response["books"];

    if(booksRes == null) throw("Error al traer los datos");

    final list = BookModel.fromListMap(booksRes);

    return list;
  }

}
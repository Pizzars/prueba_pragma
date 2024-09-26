import 'package:prueba_pragma/domain/database/pragma_db.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';
import 'package:prueba_pragma/repositories/cats_repository.dart';


class CatsPresenter {

  final inlazeDB = PragmaDB();
  final repository = CatsRepository();

  Future<List<CatModel>> getCats() async{
    try{
      final list = repository.getNews();
      return list;
    }
    catch(e) {
      throw Exception(e);
    }
  }

  Future<List<CatModel>> findCats(String search) async{
    try{
      final list = repository.findCats(search);
      return list;
    }
    catch(e) {
      throw Exception(e);
    }
  }

}
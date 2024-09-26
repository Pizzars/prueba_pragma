import 'package:prueba_pragma/domain/models/cat_image_model.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';

import '../services/api_service.dart';

class CatsRepository {

  final _service = ApiService();

  Future<List<CatModel>> getNews() async{
    final response = await _service.getData("breeds");
    final catsRes = response;

    if(catsRes == null) throw("Error al traer los datos");

    final list = CatModel.fromListMap(catsRes);

    for(int i = 0; i < list.length; i++) {
      final cat = list[i];
      final imageRes = await _service.getData("images/search?limit=1&breed_ids=${cat.id}&");
      if(imageRes != null && imageRes.length > 0) {
        final image = CatImageModel.fromMap(imageRes[0]);
        cat.image = image;
        list[i] = cat;
      }
    }

    return list;
  }

  Future<List<CatModel>> findCats(String search) async{
    final response = await _service.getData("search/$search");

    final catsRes = response["cats"];

    if(catsRes == null) throw("Error al traer los datos");

    final list = CatModel.fromListMap(catsRes);

    return list;
  }

}
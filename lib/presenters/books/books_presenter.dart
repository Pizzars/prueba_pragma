import 'package:prueba_inlaze/domain/models/book_model.dart';
import 'package:prueba_inlaze/domain/models/search_model.dart';
import 'package:prueba_inlaze/repositories/books_repository.dart';

import '../../domain/database/inlaze_db.dart';

class BooksPresenter {

  final inlazeDB = InlazeDB();
  final repository = BooksRepository();

  Future<List<BookModel>> getNews() async{
    try{
      final list = repository.getNews();
      return list;
    }
    catch(e) {
      throw Exception(e);
    }
  }

  Future<List<SearchModel>> getSearches() async{
    try{
      final list = await inlazeDB.getAllSearches();
      return list;
    }
    catch(e) {
      throw Exception(e);
    }
  }

  Future<List<BookModel>> findBooks(String search) async{
    try{
      final list = repository.findBooks(search);

      final searches = await inlazeDB.getAllSearches();
      if(searches.isNotEmpty){
          SearchModel? elementToDelete;

          for (var element in searches) {
            if(element.search == search){
              elementToDelete = element;
              await inlazeDB.deleteSearch(element.id);
            }
          }

          if(elementToDelete == null){
            if(searches.length >= 10) {
              await inlazeDB.deleteSearch(searches.first.id);
            }
          }
      }
        await inlazeDB.createSearch(search: search);

      return list;
    }
    catch(e) {
      throw Exception(e);
    }
  }

}
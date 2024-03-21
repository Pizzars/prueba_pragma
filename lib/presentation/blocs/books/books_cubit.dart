import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_inlaze/domain/models/book_model.dart';
import 'package:prueba_inlaze/domain/models/search_model.dart';

import '../../../presenters/books/books_presenter.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {

  final _presenter = BooksPresenter();

  BooksCubit({
    bool darkMode = false
  }) : super( const BooksState());

  void setError(String? error, {bool reset = false}){
    emit (state.copyWith(error: error, resetError: reset));
  }

  void setSearch(String? search){
    emit (state.copyWith(search: search));
  }

  void resetSearch(){
    emit (state.copyWith(search: null, books: null, searchReset: true));
  }

  void getNews() async {
    if(state.news != null) return;

    emit (state.copyWith(load: true));

    try{
      final books = await _presenter.getNews();
      emit (state.copyWith(load: false, news: books));
      final searches = await _presenter.getSearches();
      emit (state.copyWith(searches: searches));
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void getSearches({bool refresh = false}) async {
    if(state.searches != null && !refresh) return;

    try{
      final searches = await _presenter.getSearches();
      emit (state.copyWith(searches: searches));
    }
    catch(e) {
      emit (state.copyWith(error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void getInitialData() async {
    getNews();
    getSearches();
  }

  void findBooks(String search) async {
    setSearch(search);
    emit (state.copyWith(load: true));

    try{
      final books = await _presenter.findBooks(search);
      emit (state.copyWith(load: false, books: books));
      getSearches(refresh: true);
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }

  }

}
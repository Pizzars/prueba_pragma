import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/domain/models/cat_model.dart';

import '../../../presenters/cats/cats_presenter.dart';

part 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {

  final _presenter = CatsPresenter();

  CatsCubit({
    bool darkMode = false
  }) : super( const CatsState());

  void setError(String? error, {bool reset = false}){
    emit (state.copyWith(error: error, resetError: reset));
  }

  void setSearch(String? search){
    emit (state.copyWith(search: search));
  }

  void resetSearch(){
    emit (state.copyWith(search: null, cats: null, searchReset: true));
  }

  void getCats() async {
    if(state.cats != null) return;

    emit (state.copyWith(load: true));

    try{
      final cats = await _presenter.getCats();
      emit (state.copyWith(load: false, cats: cats));
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }
  }

  void getInitialData() async {
    getCats();
  }

  void findCats(String search) async {
    setSearch(search);
    emit (state.copyWith(load: true));

    try{
      final cats = await _presenter.findCats(search);
      emit (state.copyWith(load: false, cats: cats));
    }
    catch(e) {
      emit (state.copyWith(load: false, error: e.toString().replaceAll("Exception: ", "")));
    }

  }

}
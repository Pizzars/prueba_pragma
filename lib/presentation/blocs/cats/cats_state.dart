part of 'cats_cubit.dart';

class CatsState extends Equatable {
  final bool load;
  final String? error;
  final List<CatModel>? cats;
  final String? search;

  const CatsState({this.load = false, this.error, this.cats, this.search});

  @override
  List<Object?> get props => [ load, error, cats, search ];

  CatsState copyWith({
    bool? load,
    String? error,
    List<CatModel>? cats,
    String? search,
    bool searchReset = false,
    bool resetError = false,
  }){
    return CatsState(
      load: load ?? this.load,
      error: resetError ? null : error ?? this.error,
      cats: searchReset ? null : cats ?? this.cats,
      search: searchReset ? null : search ?? this.search,
    );
  }

}
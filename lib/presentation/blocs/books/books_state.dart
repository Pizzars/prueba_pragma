part of 'books_cubit.dart';

class BooksState extends Equatable {
  final bool load;
  final String? error;
  final List<BookModel>? books;
  final List<BookModel>? news;
  final List<SearchModel>? searches;
  final String? search;

  const BooksState({this.load = false, this.error, this.books, this.news, this.searches, this.search});

  @override
  List<Object?> get props => [ load, error, books, searches, news, search ];

  BooksState copyWith({
  bool? load,
  String? error,
  List<BookModel>? books,
  List<BookModel>? news,
  List<SearchModel>? searches,
  String? search, bool searchReset = false,
  }){
    return BooksState(
      load: load ?? this.load,
      error: error ?? this.error,
      books: searchReset ? null : books ?? this.books,
      news: news ?? this.news,
      searches: searches ?? this.searches,
      search: searchReset ? null : search ?? this.search,
    );
  }

}
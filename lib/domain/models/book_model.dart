class BookModel {
  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  BookModel({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  static List<BookModel> fromListMap(List<dynamic> list) => list.map((map) => BookModel(
    title: map["title"] ?? '',
    subtitle: map["subtitle"] ?? '',
    isbn13: map["isbn13"] ?? '',
    price: map["price"] ?? '',
    image: map["image"] ?? '',
    url: map["url"] ?? '',
  )).toList();

  factory BookModel.fromMap(Map<String, dynamic> map) => BookModel(
    title: map["title"] ?? '',
    subtitle: map["subtitle"] ?? '',
    isbn13: map["isbn13"] ?? '',
    price: map["price"] ?? '',
    image: map["image"] ?? '',
    url: map["url"] ?? '',
  );

}
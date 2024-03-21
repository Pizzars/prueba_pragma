class SearchModel {
  final int id;
  final String search;
  final String createdAt;
  final String? updatedAt;

  SearchModel({
    required this.id,
    required this.search,
    required this.createdAt,
    this.updatedAt,
  });

  factory SearchModel.fromSql(Map<String, dynamic> map) => SearchModel(
    id: map["id"] ?? 0,
    search: map["search"] ?? '',
    createdAt: map["createdAt"] ?? '',
    updatedAt: map["updatedAt"] ?? '',
  );

}
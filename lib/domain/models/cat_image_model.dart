class CatImageModel {
  String id;
  String url;
  int width;
  int height;

  CatImageModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  static List<CatImageModel> fromListMap(List<dynamic> list) => list.map((map) => CatImageModel.fromMap(map)).toList();

  factory CatImageModel.fromMap(Map<String, dynamic> map) => CatImageModel(
    id: map["id"] ?? '',
    url: map["url"] ?? '',
    width: map["width"] ?? 0,
    height: map["height"] ?? 0,
  );
}

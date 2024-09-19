class TaskModel {
  final int id;
  final bool checked;
  final String name;

  TaskModel({
    required this.id,
    required this.name,
    required this.checked
  });

  factory TaskModel.fromSql(Map<String, dynamic> map) => TaskModel(
    id: map["id"] ?? 0,
    name: map["name"] ?? '',
    checked: (map["checked"] ?? 0) == 1,
  );


  static List<TaskModel> fromListMap(List<dynamic> list) => list.map((map) => TaskModel(
    id: map["id"] ?? 0,
    name: map["name"] ?? '',
    checked: map["checked"] ?? 0 == 1,
  )).toList();

  factory TaskModel.fromMap(Map<String, dynamic> map) => TaskModel(
    id: map["id"] ?? 0,
    name: map["name"] ?? '',
    checked: map["checked"] ?? 0 == 1,
  );

}
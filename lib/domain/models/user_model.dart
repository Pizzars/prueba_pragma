class UserModel {
  final int id;
  final String name;
  final String user;
  final String password;
  final String createdAt;
  final String? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.user,
    required this.password,
    required this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromSql(Map<String, dynamic> map) => UserModel(
    id: map["id"] ?? 0,
    name: map["name"] ?? '',
    user: map["user"] ?? '',
    password: map["password"] ?? '',
    createdAt: (map["created_at"] ?? '').toString(),
    updatedAt: (map["updated_at"] ?? '').toString(),
  );

  Map<String, dynamic> toMap(){

    return {
      'id': id,
      'name': name,
      'user': user,
      'password': password,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

}
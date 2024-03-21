import 'package:prueba_inlaze/domain/database/database_service.dart';
import 'package:prueba_inlaze/domain/models/search_model.dart';
import 'package:prueba_inlaze/domain/models/user_model.dart';
import 'package:prueba_inlaze/services/connectivity.dart';
import 'package:sqflite/sqflite.dart';

class InlazeDB {
  final tableUsers = 'users';
  final tableSearches = 'searches';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableUsers (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "user" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" INTEGER NOT NULL DEFAULT 1,
    "updated_at" INTEGER,
    PRIMARY KEY("id" AUTOINCREMENT)
    );""");

    await database.execute("""CREATE TABLE IF NOT EXISTS $tableSearches (
    "id" INTEGER NOT NULL,
    "search" TEXT NOT NULL,
    "created_at" INTEGER NOT NULL DEFAULT 1,
    "updated_at" INTEGER,
    PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> createUser({ required String name, required String user, required String password }) async {
    await checkConnection();
    final database = await DatabaseService().database;
    final res = await database.rawInsert(
        '''INSERT INTO $tableUsers (name, user, password, created_at) VALUES (?,?,?,?)''',
        [name, user, password, DateTime.now().millisecondsSinceEpoch]
    );
    return res;
  }

  Future<int> createSearch({ required String search }) async {
    await checkConnection();
    final database = await DatabaseService().database;
    return await database.rawInsert(
        '''INSERT INTO $tableSearches (search, created_at) VALUES (?,?)''',
        [search, DateTime.now().millisecondsSinceEpoch]
    );
  }

  Future< List<Map<String, Object?>>> _queryAll(String table) async {
    final database = await DatabaseService().database;
    final query = await database.rawQuery(
      '''SELECT * from $table ORDER BY COALESCE(updated_at,created_at)''',
    );
    return query;
  }

  Future<Map<String, Object?>?> _queryById(String table, int id) async {
    final database = await DatabaseService().database;
    final query = await database.rawQuery(
      '''SELECT * from $table WHERE id = ?''', [id]
    );
    if(query.isEmpty) return null;
    return query.first;
  }


  Future<void> _delete(String table, int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete(
        '''DELETE FROM $table WHERE id = ?''', [id]
    );
  }

  Future<void> deleteUser(int id) async {
    await checkConnection();
    await _delete(tableUsers, id);
  }

  Future<List<UserModel>> getAllUsers() async {
    await checkConnection();
    final query = await _queryAll(tableUsers);
    return query.map((e) => UserModel.fromSql(e)).toList();
  }

  Future<UserModel?> getUserById({required int id}) async {
    await checkConnection();
    final query = await _queryById(tableUsers, id);
    if(query == null) return null;
    return UserModel.fromSql(query);
  }

  Future<UserModel?> getUserLogin({required String user, required String password}) async {
    await checkConnection();
    final database = await DatabaseService().database;
    final query = await database.rawQuery(
        '''SELECT * from $tableUsers WHERE user = ? AND password = ? ''', [user, password]
    );
    if(query.isEmpty) return null;
    return UserModel.fromSql(query.first);
  }

  Future<UserModel?> getUserByUsername({required String user}) async {
    await checkConnection();
    final database = await DatabaseService().database;
    final query = await database.rawQuery(
        '''SELECT * from $tableUsers WHERE user = ? ''', [user]
    );
    if(query.isEmpty) return null;
    return UserModel.fromSql(query.first);
  }

  Future<List<SearchModel>> getAllSearches() async {
    await checkConnection();
    final query = await _queryAll(tableSearches);
    return query.map((e) => SearchModel.fromSql(e)).toList();
  }

  Future<void> deleteSearch(int id) async {
    await checkConnection();
    await _delete(tableSearches, id);
  }

}
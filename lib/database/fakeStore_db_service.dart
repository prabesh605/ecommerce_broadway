import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/models/fake_store_model.dart';

class FakestoreDbService {
  final database = DBHelper.instance;

  Future<List<FakeStoreModel>> getAllData() async {
    final db = await database.database;
    final data = await db.query(FakeStoreModel.tableName);
    return data.map((e) => FakeStoreModel.fromJson(e)).toList();
  }

  Future<int> add(FakeStoreModel fkData) async {
    final db = await database.database;
    return db.insert(FakeStoreModel.tableName, fkData.toJson());
  }

  Future<int> remove(int id) async {
    final db = await database.database;
    return db.delete(FakeStoreModel.tableName, where: "id=?", whereArgs: [id]);
  }

  Future<int> update(int id, FakeStoreModel data) async {
    final db = await database.database;
    return db.update(
      FakeStoreModel.tableName,
      data.toJson(),
      where: "id=?",
      whereArgs: [id],
    );
  }
}

import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/models/note_model.dart';

class NoteDbService {
  final database = DBHelper.instance;

  Future<int> insert(NoteModel data) async {
    final db = await database.database;
    return db.insert(NoteModel.tableName, data.toMap());
  }

  Future<List<NoteModel>> getAll() async {
    final db = await database.database;
    final data = await db.query(NoteModel.tableName);
    return data.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<int> update(int id, NoteModel data) async {
    final db = await database.database;
    return db.update(
      NoteModel.tableName,
      data.toMap(),
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database.database;
    return db.delete(NoteModel.tableName, where: "id=?", whereArgs: [id]);
  }
}

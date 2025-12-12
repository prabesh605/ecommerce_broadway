import 'package:ecommerce_app/models/weather_offline_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note_model.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("myDatabase.db");
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute(NoteModel.createTables);
    await db.execute(WeatherOfflineModel.createTables);
  }

  Future<int> insert(NoteModel data) async {
    final db = await instance.database;
    return db.insert(NoteModel.tableName, data.toMap());
  }

  Future<List<NoteModel>> getAll() async {
    final db = await instance.database;
    final data = await db.query(NoteModel.tableName);
    return data.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<int> update(int id, NoteModel data) async {
    final db = await instance.database;
    return db.update(
      NoteModel.tableName,
      data.toMap(),
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(NoteModel.tableName, where: "id=?", whereArgs: [id]);
  }

  Future<int> insertWeather(WeatherOfflineModel data) async {
    final db = await instance.database;
    return db.insert(WeatherOfflineModel.tableName, data.toMap());
  }

  Future<List<WeatherOfflineModel>> getWeather() async {
    final db = await instance.database;
    final data = await db.query(WeatherOfflineModel.tableName);
    return data.map((e) => WeatherOfflineModel.fromMap(e)).toList();
  }
}

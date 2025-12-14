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
}

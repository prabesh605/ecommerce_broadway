import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;
  DBHelper._init();

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("myDatabase.db");
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT NOT NULL, body TEXT)',
    );
  }

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await instance.database;
    return db.insert("notes", data);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await instance.database;
    return db.query('notes');
  }

  Future<int> update(int id, Map<String, dynamic> data) async {
    final db = await instance.database;
    return db.update("notes", data, where: "id=?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete("notes", where: "id=?", whereArgs: [id]);
  }
}

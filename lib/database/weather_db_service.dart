import 'package:ecommerce_app/database/db.dart';
import 'package:ecommerce_app/models/weather_offline_model.dart';

class WeatherDbService {
  final database = DBHelper.instance;

  Future<int> insertWeather(WeatherOfflineModel data) async {
    final db = await database.database;
    return db.insert(WeatherOfflineModel.tableName, data.toMap());
  }

  Future<List<WeatherOfflineModel>> getWeather() async {
    final db = await database.database;
    final data = await db.query(WeatherOfflineModel.tableName);
    return data.map((e) => WeatherOfflineModel.fromMap(e)).toList();
  }
}

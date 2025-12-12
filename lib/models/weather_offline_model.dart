class WeatherOfflineModel {
  int? id;
  String? city;
  double temp;
  int cod;
  WeatherOfflineModel({
    this.id,
    required this.city,
    required this.temp,
    required this.cod,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "city": city, "temp": temp, "cod": cod};
  }

  factory WeatherOfflineModel.fromMap(Map<String, dynamic> map) {
    return WeatherOfflineModel(
      id: map['id'],
      city: map['city'],
      temp: map['temp'],
      cod: map['cod'],
    );
  }
  static const tableName = "weather";
  static const createTables =
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, city TEXT, temp REAL,cod INTEGER)';
}
//city
        //temp
        //cod
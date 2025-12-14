class FakeStoreModel {
  final int? id;
  final String title;
  final double price;
  FakeStoreModel({this.id, required this.title, required this.price});

  factory FakeStoreModel.fromJson(Map<String, dynamic> json) {
    return FakeStoreModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
    );
  }
  Map<String, dynamic> toJson() => {"id": id, "title": title, "price": price};

  static const tableName = "fakestore";
  static const createTables =
      'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, price REAL)';
}

class ProductModel {
  final String id;
  final String title;
  final String body;
  final double price;
  final String? image;
  ProductModel({
    required this.id,
    required this.title,
    required this.body,
    required this.price,
    this.image,
  });

  factory ProductModel.fromMap(
    Map<String, dynamic> json, {
    required String id,
  }) {
    return ProductModel(
      id: id,
      title: json['title'] ?? "",
      body: json['body'] ?? "",
      price: json['price'] ?? "",
      image: json['image'] ?? "",
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'price': price,
      'image': image,
    };
  }
}

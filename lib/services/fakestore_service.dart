import 'dart:convert';

import 'package:ecommerce_app/models/fake_store_model.dart';
import 'package:http/http.dart' as http;

class FakestoreService {
  Future<List<FakeStoreModel>> getStoreData() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      final List<FakeStoreModel> storeData = data
          .map((e) => FakeStoreModel.fromJson(e))
          .toList();
      return storeData;
    } else {
      return [];
    }
  }
}

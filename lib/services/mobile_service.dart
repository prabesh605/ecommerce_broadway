import 'dart:convert';

import 'package:ecommerce_app/models/mobile_model.dart';
import 'package:http/http.dart' as http;

class MobileService {
  Future<List<MobileModel>> getDatas() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode == 200) {
        // final data = jsonDecode(response.body);
        final List<MobileModel> mobileModel = mobileModelFromJson(
          response.body,
        );
        return mobileModel;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

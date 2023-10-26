import 'dart:convert';
import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../models/product_model/product_model.dart';

class ApiRepository {
  static Future<List<ProductModel>> getGetApi(url) async {
    List<ProductModel> products = [];
    try {
      final response = await http.get(Uri.parse(url));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var element in data) {
          products.add(ProductModel.fromJson(element));
        }
        return products;
      } else {
        throw Exception(
          'Failed to fetch data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      log(e.toString());
      rethrow; // Rethrow the exception so it can be caught in the Bloc.
    }
  }
}

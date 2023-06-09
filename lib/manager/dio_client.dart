import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stylish2023/Data/product_list.dart';

class DioClient {
  static Dio dio = Dio();

  /// https://api.appworks-school.tw/api/1.0/products/women
  static const baseURL = 'https://api.appworks-school.tw/api/1.0';

  /// 全部
  static const allProductListEndpoint = '$baseURL/products/all';

  /// 女裝
  static const womenProductListEndpoint = '$baseURL/products/women';

  /// 男裝
  static const menProductListEndpoint = '$baseURL/products/men';

  /// 配件
  static const accessoriesProductListEndpoint = '$baseURL/products/accessories';

  static Future<List<Product>> fetchProductList() async {
    try {
      final response = await dio.get(womenProductListEndpoint);
      final data = List<Map<String, dynamic>>.from(response.data['data']);
      return data.map((json) => Product.fromJson(json)).toList();
    } on DioError catch (e) {
      debugPrint('Status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to get product list');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  // ignore: unused_field
  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset = UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response> getData(String uri) async {
    try {
      final url = Uri.parse('$baseUrl$uri');
      http.Response response = await http.get(url);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return http.Response(
        e.toString(),
        1,
      );
    }
  }
}

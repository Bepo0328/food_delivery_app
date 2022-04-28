import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

  ApiClient({
    required this.appBaseUrl,
    required this.sharedPreferences,
  }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';
    _mainHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      final url = Uri.parse('$baseUrl$uri');
      http.Response response = await http.get(url, headers: headers ?? _mainHeaders);

      // debugPrint('url: $url');
      // debugPrint('headers-1: $headers');
      // debugPrint('headers-2: $_mainHeaders');

      return response;
    } catch (e) {
      debugPrint(e.toString());
      return http.Response(e.toString(), 1);
    }
  }

  Future<http.Response> postData(String uri, dynamic body) async {
    debugPrint('body: $body');
    try {
      final url = Uri.parse('$baseUrl$uri');
      http.Response response = await http.post(url, body: jsonEncode(body), headers: _mainHeaders);

      debugPrint('url: $url');
      debugPrint('headers-2: $_mainHeaders');

      return response;
    } catch (e) {
      debugPrint(e.toString());
      return http.Response(e.toString(), 1);
    }
  }
}

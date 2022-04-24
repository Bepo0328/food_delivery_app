import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<http.Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URL, signUpBody.toJson());
  }

  Future<http.Response> login(String email, String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URL, {'email': email, 'password': password});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

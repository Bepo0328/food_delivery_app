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

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}

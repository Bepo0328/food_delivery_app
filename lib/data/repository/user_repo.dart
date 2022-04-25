import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  final ApiClient apiClient;

  UserRepo({
    required this.apiClient,
  });

  Future<http.Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URL);
  }
}

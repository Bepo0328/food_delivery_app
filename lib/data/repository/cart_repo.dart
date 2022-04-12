import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:get/get.dart';

class CartRepo extends GetxService {
  final ApiClient apiClient;

  CartRepo({
    required this.apiClient,
  });
}

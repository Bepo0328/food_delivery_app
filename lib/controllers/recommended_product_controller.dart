import 'dart:convert';
import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({
    required this.recommendedProductRepo,
  });

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    http.Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(responseBody).products);
      _isLoaded = true;
      update();
    } else {}
  }
}

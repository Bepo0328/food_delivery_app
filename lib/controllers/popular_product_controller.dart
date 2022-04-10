import 'dart:convert';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    http.Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(responseBody).products);
      update();
    } else {}
  }
}

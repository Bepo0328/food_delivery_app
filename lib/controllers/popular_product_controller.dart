import 'dart:convert';
import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    http.Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(responseBody).products);
      _isLoaded = true;
      update();
    } else {}
  }
}

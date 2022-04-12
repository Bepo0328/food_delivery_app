import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/repository.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';
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

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        'Item count',
        'You can\'t reduce more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        'Item count',
        'You can\'t add more!',
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
    _inCartItems = 0;
  }
}

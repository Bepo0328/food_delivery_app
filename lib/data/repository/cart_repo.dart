import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    /*
      convert objects to string because sharedPreference only accepts string
     */
    for (var element in cartList) {
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // debugPrint('${sharedPreferences.getStringList(AppConstants.CART_LIST)}');
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      debugPrint('inside getCartList $carts');
    }
    List<CartModel> cartList = [];

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartList;
  }
}

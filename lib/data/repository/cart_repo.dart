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
    debugPrint('${sharedPreferences.getStringList(AppConstants.CART_LIST)}');
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('I am printing loading state ${Get.find<AuthController>().isLoading}');

    return Center(
      child: Container(
        height: Dimenstions.height20 * 5,
        width: Dimenstions.width20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimenstions.height10 * 5),
          color: AppColors.mainColor,
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

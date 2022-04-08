import 'package:get/get.dart';

class Dimenstions {
  // height: 781.0909090909091
  static double screenHeight = Get.context!.height;
  // width: 392.72727272727275
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.44;
  static double pageViewContainer = screenHeight / 3.55;
  static double pageViewTextContainer = screenHeight / 6.50;

  static double height10 = screenHeight / 78.10;
  static double height15 = screenHeight / 52.07;
  static double height20 = screenHeight / 39.05;
  static double height30 = screenHeight / 26.03;

  static double width10 = screenWidth / 39.27;
  static double width15 = screenWidth / 26.18;
  static double width30 = screenWidth / 13.09;

  static double font20 = screenHeight / 39.05;
}

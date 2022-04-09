import 'package:get/get.dart';

class Dimenstions {
  // height: 781.0909090909091
  static double screenHeight = Get.context!.height;
  // width: 392.72727272727275
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.44;
  static double pageViewContainer = screenHeight / 3.55;
  static double pageViewTextContainer = screenHeight / 6.50;

  // dynamic height padding and margin
  static double height05 = screenHeight / 156.21;
  static double height10 = screenHeight / 78.10;
  static double height15 = screenHeight / 52.07;
  static double height20 = screenHeight / 39.05;
  static double height25 = screenHeight / 31.24;
  static double height30 = screenHeight / 26.03;
  static double height35 = screenHeight / 22.31;
  static double height40 = screenHeight / 19.52;
  static double height45 = screenHeight / 17.35;

  // dynamic width padding and margin
  static double width05 = screenWidth / 78.50;
  static double width10 = screenWidth / 39.27;
  static double width15 = screenWidth / 26.18;
  static double width20 = screenWidth / 19.63;
  static double width25 = screenWidth / 15.70;
  static double width30 = screenWidth / 13.09;
  static double width35 = screenWidth / 11.22;
  static double width40 = screenWidth / 9.81;
  static double width45 = screenWidth / 8.72;

  static double font20 = screenHeight / 39.05;

  // radius
  static double radius15 = screenHeight / 52.07;
  static double radius20 = screenHeight / 39.05;
  static double radius30 = screenHeight / 26.03;

  // icon size
  static double iconSize15 = screenHeight / 52.07;
  static double iconSize24 = screenHeight / 32.54;
}

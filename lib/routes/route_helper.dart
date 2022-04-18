import 'package:food_delivery_app/pages/pages.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        int pageId = int.parse(Get.parameters['pageId']!);
        String page = Get.parameters['page']!;
        return PopularFoodDetail(pageId: pageId, page: page);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        int pageId = int.parse(Get.parameters['pageId']!);
        String page = Get.parameters['page']!;
        return RecommendedFoodDetail(pageId: pageId, page: page);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}

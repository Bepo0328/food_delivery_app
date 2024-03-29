import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // header
          Positioned(
            top: Dimenstions.height20 * 3,
            left: Dimenstions.width20,
            right: Dimenstions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimenstions.iconSize24,
                ),
                SizedBox(width: Dimenstions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimenstions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimenstions.iconSize24,
                ),
              ],
            ),
          ),

          // body
          GetBuilder<CartController>(
            builder: (_cartController) {
              return _cartController.getItems.isNotEmpty
                  ? Positioned(
                      top: Dimenstions.height20 * 5,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimenstions.height15),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GetBuilder<CartController>(builder: (controller) {
                            return ListView.builder(
                              itemCount: controller.getItems.length,
                              itemBuilder: (context, index) {
                                CartModel cartItem = controller.getItems[index];
                                String price = NumberFormat.simpleCurrency(decimalDigits: 1).format(cartItem.price!);

                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: Dimenstions.height05,
                                    horizontal: Dimenstions.width20,
                                  ),
                                  height: Dimenstions.height20 * 5,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          int popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(cartItem.product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(RouteHelper.getPopularFood(popularIndex, 'cartpage'));
                                          } else {
                                            int recommededIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(cartItem.product!);
                                            if (recommededIndex < 0) {
                                              Get.snackbar(
                                                'History product',
                                                'Product review is not availble for history products',
                                                backgroundColor: AppColors.mainColor,
                                                colorText: Colors.white,
                                              );
                                            } else {
                                              Get.toNamed(RouteHelper.getRecommendedFood(recommededIndex, 'cartpage'));
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: Dimenstions.height20 * 5,
                                          width: Dimenstions.width20 * 5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimenstions.radius20),
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + cartItem.img!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimenstions.width10,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: Dimenstions.height20 * 5,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              BigText(
                                                text: cartItem.name!,
                                                color: Colors.black54,
                                              ),
                                              const SmailText(
                                                text: 'Spicy',
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  BigText(
                                                    text: price,
                                                    color: Colors.redAccent,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(
                                                      vertical: Dimenstions.height10,
                                                      horizontal: Dimenstions.width10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(
                                                        Dimenstions.radius20,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.addItem(cartItem.product!, -1);
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: AppColors.signColor,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: Dimenstions.width05,
                                                        ),
                                                        BigText(
                                                          text: '${cartItem.quantity!}',
                                                        ),
                                                        SizedBox(
                                                          width: Dimenstions.width05,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.addItem(cartItem.product!, 1);
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: AppColors.signColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                      ),
                    )
                  : const NoDataPage(
                      text: 'Your cart is empty!',
                    );
            },
          ),
        ],
      ),

      // bottom
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (_cartController) {
          String totalAmount = NumberFormat.simpleCurrency(decimalDigits: 0).format(_cartController.totalAmount);

          return Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimenstions.height30,
              horizontal: Dimenstions.width20,
            ),
            height: Dimenstions.bottomHeightBar,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Dimenstions.radius20 * 2,
                ),
                topRight: Radius.circular(
                  Dimenstions.radius20 * 2,
                ),
              ),
              color: AppColors.buttonBackgroundColor,
            ),
            child: _cartController.getItems.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimenstions.height20,
                          horizontal: Dimenstions.width20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimenstions.radius20,
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimenstions.width05,
                            ),
                            BigText(
                              text: totalAmount,
                            ),
                            SizedBox(
                              width: Dimenstions.width05,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (Get.find<AuthController>().userLoggedIn()) {
                            _cartController.addToHistory();
                            if (Get.find<LocationController>().addressList.isEmpty) {
                              Get.toNamed(RouteHelper.getAddAddressPage());
                            } else {
                              Get.offNamed(RouteHelper.getInitial());
                            }
                          } else {
                            Get.toNamed(RouteHelper.getSignInPage());
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimenstions.height20,
                            horizontal: Dimenstions.width20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimenstions.radius20,
                            ),
                            color: AppColors.mainColor,
                          ),
                          child: const BigText(
                            text: 'Check out',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(),
          );
        },
      ),
    );
  }
}

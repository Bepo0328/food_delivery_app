import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;

  const PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel popularProduct =
        Get.find<PopularProductController>().popularProductList[pageId];
    String price = NumberFormat.simpleCurrency(decimalDigits: 0)
        .format(popularProduct.price!);
    Get.find<PopularProductController>()
        .initProduct(popularProduct, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimenstions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProduct.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // icon widget
          Positioned(
            top: Dimenstions.height45,
            left: Dimenstions.width20,
            right: Dimenstions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(icon: Icons.arrow_back_ios_new),
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),

          // introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimenstions.popularFoodImgSize - Dimenstions.height20,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimenstions.height20,
                horizontal: Dimenstions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimenstions.radius20,
                  ),
                  topRight: Radius.circular(
                    Dimenstions.radius20,
                  ),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: popularProduct.name!),
                  SizedBox(
                    height: Dimenstions.height20,
                  ),
                  const BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimenstions.height20,
                  ),
                  // expandable text widget
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text: popularProduct.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProductController) {
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
            child: Row(
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
                      GestureDetector(
                        onTap: () {
                          popularProductController.setQuantity(false);
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
                        text: '${popularProductController.inCartItems}',
                      ),
                      SizedBox(
                        width: Dimenstions.width05,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProductController.setQuantity(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                  child: GestureDetector(
                    onTap: () {
                      popularProductController.addItem(popularProduct);
                    },
                    child: BigText(
                      text: '$price | Add to cart',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

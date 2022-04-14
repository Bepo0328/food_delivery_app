import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;

  const RecommendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel recommendedProduct =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    String price = NumberFormat.simpleCurrency(decimalDigits: 0)
        .format(recommendedProduct.price!);
    Get.find<PopularProductController>()
        .initProduct(recommendedProduct, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(
                    icon: Icons.clear,
                  ),
                ),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? const Positioned(
                                  top: 0,
                                  right: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems >= 1
                              ? Positioned(
                                  top: Dimenstions.height03_5,
                                  right: Dimenstions.width03_5,
                                  child: BigText(
                                    text: '${controller.totalItems}',
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimenstions.height10,
                  bottom: Dimenstions.height05,
                ),
                width: double.maxFinite,
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
                child: Center(
                  child: BigText(
                    text: recommendedProduct.name!,
                    size: Dimenstions.font24,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    recommendedProduct.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimenstions.width20,
                  ),
                  child: ExpandableText(
                    text: recommendedProduct.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimenstions.height10,
                  horizontal: Dimenstions.width20 * 2.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimenstions.iconSize24,
                      ),
                    ),
                    BigText(
                      text: '$price X ${controller.inCartItems}',
                      color: AppColors.mainBlackColor,
                      size: Dimenstions.font24,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimenstions.iconSize24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: const Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(recommendedProduct);
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
                        child: BigText(
                          text: '$price | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

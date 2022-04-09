import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image/food0.png',
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
              children: const [
                AppIcon(icon: Icons.arrow_back_ios_new),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                  const AppColumn(text: 'Chinese Side'),
                  SizedBox(
                    height: Dimenstions.height20,
                  ),
                  const BigText(text: 'Introduce'),
                  SizedBox(
                    height: Dimenstions.height20,
                  ),
                  // expandable text widget
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text:
                            'Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                  const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimenstions.width05,
                  ),
                  const BigText(
                    text: '0',
                  ),
                  SizedBox(
                    width: Dimenstions.width05,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signColor,
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
              child: const BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

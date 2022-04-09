import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/home.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            SizedBox(
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimenstions.height20,
                  bottom: Dimenstions.height05,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimenstions.width20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const BigText(
                          text: 'Bangladesh',
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: const [
                            SmailText(
                              text: 'Narsingdi',
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimenstions.width45,
                        height: Dimenstions.height45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimenstions.radius15,
                          ),
                          color: AppColors.mainColor,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimenstions.iconSize24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Body
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

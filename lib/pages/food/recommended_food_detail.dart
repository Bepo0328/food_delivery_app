import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(
                  icon: Icons.clear,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                    text: 'Chinese Side',
                    size: Dimenstions.font24,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice. Chicken marinated in a spiced yoghuty is placed in a large pot, then layered with fried onions (cheeky easy sub below!), fresh coriander/cilantro, then par boiled lightly spiced rice.',
            ),
          ),
        ],
      ),
    );
  }
}

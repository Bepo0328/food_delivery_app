import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartModel> getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time!)) {
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          // header
          Container(
            padding: EdgeInsets.only(top: Dimenstions.height45),
            height: Dimenstions.height20 * 5,
            width: double.maxFinite,
            color: AppColors.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                BigText(
                  text: 'Cart History',
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),

          // body
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimenstions.height20,
                horizontal: Dimenstions.width20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: itemsPerOrder.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Dimenstions.width10,
                      ),
                      height: Dimenstions.height20 * 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (() {
                            DateTime parseDate = DateTime.parse(getCartHistoryList[listCounter].time!);
                            DateFormat outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
                            String outputDate = outputFormat.format(parseDate);

                            return BigText(
                              text: outputDate,
                            );
                          }()),
                          SizedBox(
                            height: Dimenstions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemsPerOrder[index], (index2) {
                                  if (listCounter < getCartHistoryList.length) {
                                    listCounter++;
                                  }

                                  return index2 <= 2
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: Dimenstions.width05 / 2,
                                          ),
                                          height: Dimenstions.height20 * 4,
                                          width: Dimenstions.width20 * 4,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimenstions.radius15 / 2),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + getCartHistoryList[listCounter - 1].img!,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Container();
                                }),
                              ),
                              SizedBox(
                                height: Dimenstions.height20 * 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SmailText(
                                      text: 'Total',
                                      color: AppColors.titleColor,
                                    ),
                                    BigText(
                                      text: '${itemsPerOrder[index]} Items',
                                      color: AppColors.titleColor,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        var orderTime = cartOrderTimeToList();
                                        Map<int, CartModel> moreOrder = {};

                                        for (int i = 0; i < getCartHistoryList.length; i++) {
                                          if (getCartHistoryList[i].time == orderTime[index]) {
                                            moreOrder.putIfAbsent(
                                              getCartHistoryList[i].id!,
                                              () => CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[i]))),
                                            );
                                          }
                                        }
                                        Get.find<CartController>().setItems = moreOrder;
                                        Get.find<CartController>().addToCartList();
                                        Get.toNamed(RouteHelper.getCartPage());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: Dimenstions.height05,
                                          horizontal: Dimenstions.width10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimenstions.radius15 / 3,
                                          ),
                                          border: Border.all(width: 1, color: AppColors.mainColor),
                                        ),
                                        child: const SmailText(
                                          text: 'one more',
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

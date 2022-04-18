import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimenstions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slidere setcion
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? SizedBox(
                    height: Dimenstions.pageView,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                          index,
                          popularProducts.popularProductList[index],
                        );
                      },
                    ),
                  )
                : const CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        ),

        // dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: Dimenstions.height30,
        ),

        // popular text
        Container(
          margin: EdgeInsets.only(
            left: Dimenstions.width30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(
                text: 'Recommended',
              ),
              SizedBox(
                width: Dimenstions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimenstions.width10,
              ),
              const SmailText(text: 'Food pariring'),
            ],
          ),
        ),
        SizedBox(
          height: Dimenstions.height30,
        ),

        // recommended food

        // list of food and images
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProductController) {
            return recommendedProductController.isLoaded
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: recommendedProductController.recommendedProductList.length,
                    itemBuilder: (context, index) {
                      ProductModel recommendedProduct = recommendedProductController.recommendedProductList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getRecommendedFood(index, 'home'));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: Dimenstions.height05,
                            horizontal: Dimenstions.width20,
                          ),
                          child: Row(
                            children: [
                              // image section
                              Container(
                                width: Dimenstions.listViewImgSize,
                                height: Dimenstions.listViewImgSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Dimenstions.radius20,
                                  ),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      AppConstants.BASE_URL + AppConstants.UPLOAD_URL + recommendedProduct.img!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // text container
                              Expanded(
                                child: Container(
                                  height: Dimenstions.listViewTextConSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        Dimenstions.radius20,
                                      ),
                                      bottomRight: Radius.circular(
                                        Dimenstions.radius20,
                                      ),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Dimenstions.width10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: recommendedProduct.name!,
                                        ),
                                        SizedBox(
                                          height: Dimenstions.height10,
                                        ),
                                        const SmailText(
                                          text: 'With chinese characteristics',
                                        ),
                                        SizedBox(
                                          height: Dimenstions.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const [
                                            IconAndText(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: AppColors.iconColor1,
                                            ),
                                            IconAndText(
                                              icon: Icons.location_on,
                                              text: '1.7km',
                                              iconColor: AppColors.mainColor,
                                            ),
                                            IconAndText(
                                              icon: Icons.access_time_rounded,
                                              text: '32min',
                                              iconColor: AppColors.iconColor2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index, 'home'));
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimenstions.width10,
              ),
              height: Dimenstions.pageViewContainer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimenstions.radius30,
                ),
                color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                image: DecorationImage(
                  image: NetworkImage(
                    AppConstants.BASE_URL + AppConstants.UPLOAD_URL + popularProduct.img!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: Dimenstions.width30,
                right: Dimenstions.width30,
                bottom: Dimenstions.height30,
              ),
              height: Dimenstions.pageViewTextContainer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimenstions.radius20,
                ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimenstions.height15,
                  left: Dimenstions.width15,
                  right: Dimenstions.width15,
                ),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

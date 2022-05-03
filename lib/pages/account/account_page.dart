import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/controllers.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      debugPrint('User has logged in');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const BigText(
          text: 'Profile',
          size: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (_userController) {
        debugPrint('_userLoggedIn: $_userLoggedIn');
        return _userLoggedIn
            ? (!_userController.isLoading
                ? Container(
                    margin: EdgeInsets.only(
                      top: Dimenstions.height20,
                    ),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        // profile icon
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimenstions.iconSize15 * 5,
                          size: Dimenstions.height15 * 10,
                        ),
                        SizedBox(height: Dimenstions.height30),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                // name
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.person,
                                    backgroundColor: AppColors.mainColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimenstions.iconSize10 * 5 / 2,
                                    size: Dimenstions.height10 * 5,
                                  ),
                                  bigText: BigText(
                                    text: _userController.userModel!.name,
                                  ),
                                ),
                                SizedBox(height: Dimenstions.height20),

                                // phone
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.phone,
                                    backgroundColor: AppColors.yellowColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimenstions.iconSize10 * 5 / 2,
                                    size: Dimenstions.height10 * 5,
                                  ),
                                  bigText: BigText(
                                    text: _userController.userModel!.phone,
                                  ),
                                ),
                                SizedBox(height: Dimenstions.height20),

                                // email
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.email,
                                    backgroundColor: AppColors.yellowColor,
                                    iconColor: Colors.white,
                                    iconSize: Dimenstions.iconSize10 * 5 / 2,
                                    size: Dimenstions.height10 * 5,
                                  ),
                                  bigText: BigText(
                                    text: _userController.userModel!.email,
                                  ),
                                ),
                                SizedBox(height: Dimenstions.height20),

                                // address
                                GetBuilder<LocationController>(builder: (_locationController) {
                                  if (_userLoggedIn && _locationController.addressList.isEmpty) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.getAddAddressPage());
                                      },
                                      child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          backgroundColor: AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimenstions.iconSize10 * 5 / 2,
                                          size: Dimenstions.height10 * 5,
                                        ),
                                        bigText: const BigText(
                                          text: 'Fill in your address',
                                        ),
                                      ),
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.getAddAddressPage());
                                      },
                                      child: AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          backgroundColor: AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimenstions.iconSize10 * 5 / 2,
                                          size: Dimenstions.height10 * 5,
                                        ),
                                        bigText: const BigText(
                                          text: 'Your address',
                                        ),
                                      ),
                                    );
                                  }
                                }),
                                SizedBox(height: Dimenstions.height20),

                                // message
                                AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.message_outlined,
                                    backgroundColor: Colors.redAccent,
                                    iconColor: Colors.white,
                                    iconSize: Dimenstions.iconSize10 * 5 / 2,
                                    size: Dimenstions.height10 * 5,
                                  ),
                                  bigText: const BigText(
                                    text: 'Messages',
                                  ),
                                ),
                                SizedBox(height: Dimenstions.height20),

                                // logout
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>().userLoggedIn()) {
                                      Get.find<AuthController>().clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>().clearCartHistory();
                                      Get.find<LocationController>().clearAddressList();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    } else {
                                      debugPrint('you logged out');
                                    }
                                  },
                                  child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimenstions.iconSize10 * 5 / 2,
                                      size: Dimenstions.height10 * 5,
                                    ),
                                    bigText: const BigText(
                                      text: 'Logout',
                                    ),
                                  ),
                                ),
                                SizedBox(height: Dimenstions.height20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CustomLoader())
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimenstions.width20,
                      ),
                      height: Dimenstions.height20 * 8,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimenstions.radius20),
                        image: const DecorationImage(
                          image: AssetImage('assets/image/signintocontinue.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getSignInPage());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimenstions.width20,
                        ),
                        height: Dimenstions.height20 * 5,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimenstions.radius20),
                        ),
                        child: Center(
                          child: BigText(
                            text: 'Sign in',
                            color: Colors.white,
                            size: Dimenstions.font26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}

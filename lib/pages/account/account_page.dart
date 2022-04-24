import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                      bigText: const BigText(
                        text: 'Ahmed',
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
                      bigText: const BigText(
                        text: '12-3456-7890',
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
                      bigText: const BigText(
                        text: 'test@email.com',
                      ),
                    ),
                    SizedBox(height: Dimenstions.height20),

                    // address
                    AccountWidget(
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
                    AccountWidget(
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
                    SizedBox(height: Dimenstions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

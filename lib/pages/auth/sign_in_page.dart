import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/pages.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // app logo
              SizedBox(
                height: Dimenstions.screenHeight * 0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimenstions.radius20 * 4,
                    backgroundImage: const AssetImage(
                      'assets/image/logo part 1.png',
                    ),
                  ),
                ),
              ),

              // welcome
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimenstions.width20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: Dimenstions.font10 * 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sign into your account',
                      style: TextStyle(
                        fontSize: Dimenstions.font20,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimenstions.height30),

              // your phone
              AppTextField(
                textController: phoneController,
                hintText: 'Phone',
                icon: Icons.phone_android,
              ),
              SizedBox(height: Dimenstions.height20),

              // your password
              AppTextField(
                textController: passwordController,
                hintText: 'Password',
                icon: Icons.password_sharp,
                isObscure: true,
              ),
              SizedBox(height: Dimenstions.height20),

              // footer
              // tag line
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Sign into your account',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimenstions.font20,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimenstions.width20),
                ],
              ),
              SizedBox(height: Dimenstions.screenHeight * 0.05),

              // sign in button
              Container(
                height: Dimenstions.screenHeight / 13,
                width: Dimenstions.screenWidth / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimenstions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: 'Sing in',
                    size: Dimenstions.font30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Dimenstions.screenHeight * 0.05),

              // sign in options
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimenstions.font20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(
                              () => const SignUpPage(),
                              transition: Transition.fadeIn,
                            ),
                      text: 'Create',
                      style: TextStyle(
                        color: AppColors.mainBlackColor,
                        fontSize: Dimenstions.font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

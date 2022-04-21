import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      'g.png',
      't.png',
      'f.png',
    ];

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

              // your email
              AppTextField(
                textController: emailController,
                hintText: 'Email',
                icon: Icons.email,
              ),
              SizedBox(height: Dimenstions.height20),

              // your password
              AppTextField(
                textController: passwordController,
                hintText: 'Password',
                icon: Icons.password_sharp,
              ),
              SizedBox(height: Dimenstions.height20),

              // your phone
              AppTextField(
                textController: phoneController,
                hintText: 'Phone',
                icon: Icons.phone_android,
              ),
              SizedBox(height: Dimenstions.height20),

              // your name
              AppTextField(
                textController: nameController,
                hintText: 'Name',
                icon: Icons.person,
                iconColor: Colors.grey,
              ),
              SizedBox(height: Dimenstions.height20),

              // footer
              // sign up button
              Container(
                height: Dimenstions.screenHeight / 13,
                width: Dimenstions.screenWidth / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimenstions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: 'Sing up',
                    size: Dimenstions.font30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: Dimenstions.height10),

              // tag line
              RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Have an account already?',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimenstions.font20,
                  ),
                ),
              ),
              SizedBox(height: Dimenstions.screenHeight * 0.05),

              // sign up options
              RichText(
                text: TextSpan(
                  text: 'Sign up using one of the following methods',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimenstions.font16,
                  ),
                ),
              ),
              Wrap(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.all(Dimenstions.height10),
                    child: CircleAvatar(
                      radius: Dimenstions.radius25,
                      backgroundImage: AssetImage('assets/image/${signUpImages[index]}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
          ],
        ),
      ),
    );
  }
}

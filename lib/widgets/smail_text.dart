import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';

class SmailText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;

  const SmailText({
    Key? key,
    this.color = AppColors.textColor,
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}

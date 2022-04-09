import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const BigText({
    Key? key,
    this.color = AppColors.mainBlackColor,
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? Dimenstions.font20 : size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimenstions.font26,
        ),
        SizedBox(
          height: Dimenstions.height10,
        ),

        // comments setcion
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimenstions.iconSize15,
                ),
              ),
            ),
            SizedBox(
              width: Dimenstions.width10,
            ),
            const SmailText(text: '4.5'),
            SizedBox(
              width: Dimenstions.width10,
            ),
            const SmailText(text: '1287 comments'),
          ],
        ),
        SizedBox(
          height: Dimenstions.height20,
        ),

        // time and distance
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
    );
  }
}

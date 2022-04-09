import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/utils.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeigth = Dimenstions.screenHeight / 5.20;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeigth) {
      firstHalf = widget.text.substring(0, textHeigth.toInt());
      secondHalf =
          widget.text.substring(textHeigth.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmailText(
              text: firstHalf,
              color: AppColors.paraColor,
              size: Dimenstions.font14,
              height: 1.6,
            )
          : Column(
              children: [
                SmailText(
                  text: hiddenText
                      ? (firstHalf + '...')
                      : (firstHalf + secondHalf),
                  color: AppColors.paraColor,
                  size: Dimenstions.font14,
                  height: 1.6,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      const SmailText(
                        text: 'Show more',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

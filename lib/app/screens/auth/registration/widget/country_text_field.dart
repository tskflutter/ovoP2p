import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';

class CountryTextField extends StatelessWidget {

  final String text;
  final VoidCallback press;

  const CountryTextField({super.key,
    required this.text,
    required this.press
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          border: Border.all(color: MyColor.getBorderColor(),width: .5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              text.tr,
              style: regularDefault.copyWith(color: MyColor.getBodyTextColor())
            ),
             Icon(
              Icons.expand_more_rounded,color: MyColor.getBodyTextColor(),
              size: 20
            )
          ],
        ),
      ),
    );
  }
}

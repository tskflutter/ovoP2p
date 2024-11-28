import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';

class CategoryButton extends StatelessWidget {

  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double textSize;

  const CategoryButton({
    super.key,
    required this.text,
    this.horizontalPadding=3,
    this.verticalPadding=3,
    this.textSize= Dimensions.fontSmall,
    required this.press,
    this.color = MyColor.black,
    this.textColor = MyColor.white,
  }) ;

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(4),
        child:  Container(
          padding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
          decoration: BoxDecoration(
            color: MyColor.getTransparentColor(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text.tr,
            style: regularDefault.copyWith(color: textColor,fontSize: textSize),
           ),
          ),
        )
    );
  }

}
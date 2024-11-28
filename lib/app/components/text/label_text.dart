import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';

class LabelText extends StatelessWidget {
  final bool isRequired;
  final String text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  const LabelText({
    super.key,
    required this.text,
    this.textAlign,
    this.textStyle,
    this.isRequired = false,
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return isRequired
        ? Row(
            children: [
              Text(text.tr, textAlign: textAlign, style: textStyle ?? regularDefault.copyWith(color: MyColor.getBodyTextColor())),
              const SizedBox(
                width: 2,
              ),
              Text(
                '*',
                style: semiBoldDefault.copyWith(color: MyColor.getErrorColor()),
              )
            ],
          )
        : Text(
            text.tr, 
            textAlign: textAlign,
            style: textStyle ?? semiBoldDefault.copyWith(color: MyColor.black),
          );
  }
}

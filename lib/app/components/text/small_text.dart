import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/style.dart';

class SmallText extends StatelessWidget {

  final String text;
  final TextAlign? textAlign;
  final TextStyle textStyle;
  final int maxLine;
  final Color textColor;

  const SmallText({
    super.key,
    required this.text,
    this.textAlign,
    this.maxLine = 1,
    this.textColor = MyColor.lightBodyText,
    this.textStyle = regularSmall
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Text(
      text.tr,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}

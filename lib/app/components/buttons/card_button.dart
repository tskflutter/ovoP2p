import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:get/get.dart';

class CardButton extends StatelessWidget {

  final VoidCallback press;
  final IconData icon;
  final String? text;
  final Color bgColor;
  final Color contentColor;
  final bool isText;

  const CardButton({
    super.key,
    this.text,
    required this.icon,
    this.isText = true,
    this.bgColor = MyColor.black,
    this.contentColor = MyColor.white,
    required this.press
  });

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space15),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: contentColor, size: 15),
            isText ? const SizedBox(width: Dimensions.space8) : const SizedBox(),
            isText ? Text(text?.tr??'', style: regularSmall.copyWith(color: contentColor), overflow: TextOverflow.ellipsis) : const SizedBox()
          ],
        ),
      ),
    );
  }
}

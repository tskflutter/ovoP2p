import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class CustomRoundedCard extends StatelessWidget {
  final Widget child;
  final bool hasPadding;
  final Color? bgColor;
  final Color? borderColor;
  const CustomRoundedCard({super.key, required this.child, this.hasPadding = true, this.bgColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: hasPadding ? const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15) : null,
      decoration: BoxDecoration(border: Border.all(color: borderColor ?? MyColor.getBorderColor()), color: bgColor ?? MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space20)),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class TradeButton extends StatelessWidget {
  final double horizontalPadding;
  final void Function() onTap;
  final double verticalPadding;
  final double borderRadious;
  final String name;
  final Color color;
  final bool isHeadingTextColor;
  final bool isGradianTextColor;
  final TextStyle? textStyle;
  final bool hasBorder;
  const TradeButton({super.key, required this.onTap, this.isGradianTextColor = false, this.horizontalPadding = Dimensions.space25, this.verticalPadding = Dimensions.space13, required this.name, this.isHeadingTextColor = true, this.hasBorder = true, this.color = MyColor.lightCardColor, this.borderRadious = Dimensions.space12, this.textStyle});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
            color: color,
            border: hasBorder
                ? Border.all(
                    color: MyColor.getBorderColor(),
                  )
                : null,
            borderRadius: BorderRadius.circular(borderRadious.w)),
        child: Center(
          child: isGradianTextColor
              ? ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      stops: [0.04, 0.4],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: MyColor.cardGradiant,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: Text(
                    name.tr,
                    style: textStyle ?? theme.textTheme.headlineSmall?.copyWith(color: isHeadingTextColor ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                  ),
                )
              : Text(
                  name.tr,
                  style: textStyle ?? theme.textTheme.headlineSmall?.copyWith(color: isHeadingTextColor ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                ),
        ),
      ),
    );
  }
}

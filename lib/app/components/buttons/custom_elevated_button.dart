import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class CustomElevatedBtn extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final double radius;
  final double elevation;
  final Color bgColor;
  final Color? textColor;
  final Color borderColor;
  final Color shadowColor;
  final double width;
  final double height;
  final Widget? icon;
  final bool isLoading;
  final bool hasGradiant;
  final TextStyle? textStyle;

  const CustomElevatedBtn({
    super.key,
    required this.text,
    required this.onTap,
    this.radius = Dimensions.largeRadius,
    this.elevation = 0,
    this.textStyle,
    this.bgColor = MyColor.lightPrimary,
    this.shadowColor = MyColor.lightPrimary,
    this.width = double.infinity,
    this.height = Dimensions.defaultButtonH,
    this.icon,
    this.isLoading = false,
    this.hasGradiant = true,
    this.textColor = MyColor.white,
    this.borderColor = MyColor.transparent,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return icon != null
        ? ElevatedButton.icon(
            icon: isLoading ? const SizedBox.shrink() : icon ?? const SizedBox.shrink(),
            onPressed: () {
              if (isLoading == false) {
                FocusScope.of(context).unfocus();
                onTap();
              }
            }, //
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor, //
              elevation: elevation, //
              surfaceTintColor: bgColor.withValues(alpha: 0.5),
              overlayColor: bgColor.withValues(alpha: 0.1), // Set your splash color h
              shadowColor: shadowColor.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(side: BorderSide(color: borderColor, width: 1), borderRadius: BorderRadius.circular(radius)),
              maximumSize: Size.fromHeight(height),
              minimumSize: Size(width, height),
              splashFactory: InkRipple.splashFactory,
            ),
            label: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    text, //
                    style: textStyle ?? theme.textTheme.bodyLarge?.copyWith(color: textColor),
                  ),
          )
        : Container(
            decoration: BoxDecoration(
              color: hasGradiant ? null : bgColor,
              borderRadius: BorderRadius.circular(Dimensions.space8),
              gradient: hasGradiant ? const LinearGradient(stops: [0.04, 0.4], begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [MyColor.lightSecondaryButton, MyColor.lightSecondary]) : null,
            ),
            child: ElevatedButton(
              onPressed: () {
                if (isLoading == false) {
                  FocusScope.of(context).unfocus();
                  onTap();
                }
              }, //
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColor.transparent, //

                elevation: elevation, //
                shadowColor: shadowColor.withValues(alpha: 0.5),
                overlayColor: bgColor.withValues(alpha: 0.1), // Set your splash color h
                splashFactory: InkRipple.splashFactory,
                shape: RoundedRectangleBorder(side: BorderSide(color: borderColor, width: 1), borderRadius: BorderRadius.circular(radius)),
                maximumSize: Size.fromHeight(height),
                minimumSize: Size(width, height),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text(text, //
                      style: textStyle ?? theme.textTheme.headlineSmall?.copyWith(color: textColor ?? MyColor.getHeadingTextColor())),
            ),
          );
  }
}

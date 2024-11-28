import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class BottomSheetCloseButton extends StatelessWidget {
  const BottomSheetCloseButton({super.key});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(Dimensions.space5),
        decoration: BoxDecoration(color: MyColor.getWarningColor().withOpacity(.1), shape: BoxShape.circle),
        child: Icon(Icons.clear, color: MyColor.getWarningColor(), size: 15),
      ),
    );
  }
}

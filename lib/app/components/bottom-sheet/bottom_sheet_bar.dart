import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_color.dart';

class BottomSheetBar extends StatelessWidget {
  const BottomSheetBar({super.key});

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 5,
        width: 50,
        decoration: BoxDecoration(color: MyColor.getBorderColor().withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

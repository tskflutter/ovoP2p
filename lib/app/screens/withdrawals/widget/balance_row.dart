import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class BalanceRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isCompleted;
  const BalanceRow({super.key, required this.title, required this.value, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space15.sp)),
        Text(value, style: theme.textTheme.labelSmall?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: isCompleted ? MyColor.getSuccessColor() : null)),
      ],
    );
  }
}

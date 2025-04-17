import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class AmountDetailsRow extends StatelessWidget {
  final String title;
  final String value;
  const AmountDetailsRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
        ),
        Flexible(
          child: Text(
            value,
            style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getHeadingTextColor()),
          ),
        ),
      ],
    );
  }
}

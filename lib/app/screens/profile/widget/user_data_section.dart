import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';

class UserDataSection extends StatelessWidget {
  final String title;
  final String subTitle;
  const UserDataSection({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(Dimensions.space12),
      decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: Dimensions.space10),
              Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getBodyTextColor()),
              ),
              Text(
                subTitle,
                style: theme.textTheme.bodyLarge?.copyWith(color: MyColor.getHeadingTextColor(), fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}

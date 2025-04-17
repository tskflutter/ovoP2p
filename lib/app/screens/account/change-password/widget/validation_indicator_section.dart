import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class ValidationIndicatorSection extends StatelessWidget {
  final String title;
  final bool isDone;
  const ValidationIndicatorSection({super.key, required this.title, required this.isDone});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        MyAssetImageWidget(
          assetPath: MyImages.done,
          isSvg: true,
          height: Dimensions.space16.h,
          width: Dimensions.space16.h,
          color: isDone ? MyColor.getSuccessColor() : null,
        ),
        spaceSide(Dimensions.space2.w),
        Text(
          title.tr,
          style: theme.textTheme.labelSmall?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
        )
      ],
    );
  }
}

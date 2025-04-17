import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/app_style.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 20,
          backgroundImage: NetworkImage("https://wallpapers.com/images/hd/cool-profile-picture-paper-bag-head-4co57dtwk64fb7lv.jpg"),
        ),
        spaceSide(Dimensions.space12.w),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "Albert Flores",
                  style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
                ),
                spaceSide(Dimensions.space4.w),
                MyAssetImageWidget(
                  assetPath: MyImages.verifiedTik,
                  isSvg: true,
                  height: 16,
                  width: 16,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "1128 orders | ",
                  style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getBodyTextColor()),
                ),
                MyAssetImageWidget(
                  assetPath: MyImages.thumb,
                  isSvg: true,
                  height: Dimensions.space14.h,
                  width: Dimensions.space14.h,
                ),
                Text(
                  " 95.25%",
                  style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getHeadingTextColor()),
                ),
              ],
            )
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            "3.85 Minute",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            MyStrings.avgReleaseTime.tr,
            style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getHeadingTextColor()),
          )
        ])
      ],
    );
  }
}

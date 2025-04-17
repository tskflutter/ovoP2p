import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/dimensions.dart';

import '../../../../core/utils/util_exporter.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Row(
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
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
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
                    MyAssetImageWidget(
                      assetPath: MyImages.activeIndicator,
                      isSvg: true,
                      height: Dimensions.space8.h,
                      width: Dimensions.space8.h,
                    ),
                    spaceSide(Dimensions.space4.w),
                    Text(
                      MyStrings.activeNow.tr,
                      style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getBodyTextColor()),
                    ),
                  ],
                )
              ]),
            ),
            MyAssetImageWidget(
              assetPath: MyImages.more,
              isSvg: true,
              height: Dimensions.space30.h,
              width: Dimensions.space30.h,
            )
          ],
        ),
      ],
    );
  }
}

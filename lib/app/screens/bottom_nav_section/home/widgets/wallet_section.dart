import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => Container(
            width: MediaQuery.of(context).size.width / 1.2,
            margin: EdgeInsets.only(right: Dimensions.space8.w),
            decoration: BoxDecoration(color: MyColor.lightCardColor, border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space20)),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.space24.w, vertical: Dimensions.space16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: MyColor.getCardBackgroundColor(),
                      child: MyAssetImageWidget(
                        assetPath: MyImages.eth,
                        boxFit: BoxFit.cover,
                        isSvg: true,
                        height: 24,
                      ),
                    ),
                    spaceSide(Dimensions.space8.w),
                    Expanded(
                      child: Text(
                        "ETH Wallet",
                        style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor(), fontWeight: FontWeight.w700),
                      ),
                    ),
                    MyAssetImageWidget(
                      assetPath: MyImages.eth2,
                      isSvg: true,
                      height: Dimensions.space40.h,
                      width: Dimensions.space40.h,
                    )
                  ],
                ),
                spaceDown(Dimensions.space15.h),
                Text(
                  "8.42589632 ETH",
                  style: theme.textTheme.headlineLarge?.copyWith(fontSize: Dimensions.space28.sp, fontWeight: FontWeight.w700, color: MyColor.getHeadingTextColor()),
                ),
                spaceDown(Dimensions.space12.h),
                Row(
                  children: [
                    Text(
                      "In Usd",
                      style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.space4.w),
                      child: MyAssetImageWidget(
                        assetPath: MyImages.arrowForward,
                        isSvg: true,
                        height: Dimensions.space16.w,
                        width: Dimensions.space16.w,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$122222.45",
                        style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, fontWeight: FontWeight.w700, color: MyColor.getBodyTextColor()),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

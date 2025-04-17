import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text/gradiant_text.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

class SellerAccountDetailsCard extends StatelessWidget {
  const SellerAccountDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(Dimensions.space16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12.sp), color: MyColor.lightCardColor2.withValues(alpha: .65)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "• ",
                style: theme.textTheme.titleLarge?.copyWith(fontSize: Dimensions.space17.sp, color: MyColor.getSecondaryColor()),
              ),
              Expanded(
                child: Text(
                  "PayPal",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: Dimensions.space17.sp,
                  ),
                ),
              ),
              GradientText(
                "Change",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: Dimensions.space15.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          spaceDown(Dimensions.space12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.referenceMsg.tr,
                style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
              ),
              Flexible(
                child: Text(
                  "2269567524766466",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: Dimensions.space13.sp,
                  ),
                ),
              ),
            ],
          ),
          spaceDown(Dimensions.space12.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  "PayPal Wallet",
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                ),
              ),
              Text(
                "27582786467",
                style: theme.textTheme.titleLarge?.copyWith(
                  fontSize: Dimensions.space13.sp,
                ),
              ),
              spaceSide(Dimensions.space4.w),
              MyAssetImageWidget(
                assetPath: MyImages.copySvg,
                isSvg: true,
                height: Dimensions.space16.h,
                width: Dimensions.space16.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}

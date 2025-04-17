import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/app_style.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';

class OrderCreationDetailsCard extends StatelessWidget {
  const OrderCreationDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(Dimensions.space16),
      decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space12.sp), color: MyColor.lightCardColor2.withValues(alpha: .65)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  MyStrings.fiatAmount.tr,
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                ),
              ),
              Text(
                "\$12,256.00",
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
          spaceDown(Dimensions.space12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.price.tr,
                style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
              ),
              Flexible(
                child: Text(
                  "\$13,301,825.55",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: Dimensions.space13.sp,
                  ),
                ),
              ),
            ],
          ),
          spaceDown(Dimensions.space12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyStrings.receiveQty.tr,
                style: theme.textTheme.labelMedium?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
              ),
              Flexible(
                child: Text(
                  "0.00092137 ETH",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: Dimensions.space13.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

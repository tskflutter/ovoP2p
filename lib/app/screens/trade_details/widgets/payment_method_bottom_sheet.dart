import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/image/my_network_image_widget.dart';
import 'package:ovolutter/app/components/row_widget/bottom_sheet_top_row.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/trade_details/trade_details_controller.dart';

class PaymentMethodBottomsheet {
  static void paymentMethodBottomsheet(
    BuildContext context,
  ) {
    ThemeData theme = Theme.of(context);
    CustomBottomSheet(
      bgColor: MyColor.pcBackground,
      child: GetBuilder<TradeDetailsController>(
          builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomSheetTopRow(header: MyStrings.currency.tr),
                  ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: Dimensions.space16.h),
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.space12.w, vertical: Dimensions.space16.h),
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), border: Border.all(color: MyColor.getBorderColor())),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLmMrr1fC5bVIE66ZENl95VJHoXHkeoxJsAo9d5Mk-Km6UkgLkmMu8iO2PUwGoxt21WYQ&usqp=CAU"),
                            ),
                            spaceSide(Dimensions.space8.w),
                            Text(
                              "PayPal",
                              style: theme.textTheme.titleMedium?.copyWith(fontSize: Dimensions.space17.sp),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              )),
    ).customBottomSheet(context);
  }
}

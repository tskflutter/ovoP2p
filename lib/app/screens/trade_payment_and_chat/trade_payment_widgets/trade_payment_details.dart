import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/trade_payment_and_chat/trade_payment_widgets/stepper_section.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/trade_details_and_chat/trade_details_and_chat_controller.dart';

class TradePaymentDetails extends StatefulWidget {
  const TradePaymentDetails({super.key});

  @override
  State<TradePaymentDetails> createState() => _TradePaymentDetailsState();
}

class _TradePaymentDetailsState extends State<TradePaymentDetails> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TradeDetailsAndChatController>(
        builder: (controller) => Column(
              children: [
                spaceDown(Dimensions.space10),
                Row(
                  children: [
                    Expanded(
                      child: Text(MyStrings.orderCreated.tr,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: Dimensions.space20.sp,
                          )),
                    ),
                    Text(MyStrings.paytheSellerWithin.tr,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: Dimensions.space15.sp,
                        )),
                    spaceSide(Dimensions.space4),
                    Text("14.34", style: theme.textTheme.titleSmall?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getSecondaryColor())),
                  ],
                ),
                // spaceDown(Dimensions.space10.h),
                Row(
                  children: [
                    Text(MyStrings.orderNumber.tr,
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontSize: Dimensions.space15.sp,
                        )),
                    spaceSide(Dimensions.space4),
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text("2269567524766466",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontSize: Dimensions.space15.sp,
                                )),
                          ),
                          spaceSide(Dimensions.space4.w),
                          MyAssetImageWidget(
                            assetPath: MyImages.copySvg,
                            isSvg: true,
                            height: Dimensions.space20.h,
                            width: Dimensions.space20.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                spaceDown(Dimensions.space20.h),

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     StepSection(),
                //     spaceSide(Dimensions.space5.w),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           spaceDown(Dimensions.space4.h),
                //           Text(
                //             MyStrings.orderCreated.tr,
                //             style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                //           ),
                //           spaceDown(Dimensions.space10),
                //           OrderCreationDetailsCard(),
                //           spaceDown(Dimensions.space30.h),
                //           Text(
                //             "Transfer \$12,256.00 USD",
                //             style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                //           ),
                //           Text(
                //             MyStrings.transfertheFundstoTheSellersAccountProvidedBelow.tr,
                //             style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space12.sp, color: MyColor.getBodyTextColor()),
                //           ),
                //           spaceDown(Dimensions.space10.h),
                //           SellerAccountDetailsCard(),
                //           spaceDown(Dimensions.space15.h),
                //           Text(
                //             MyStrings.notifySeller.tr,
                //             style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                //           ),
                //           Text(
                //             MyStrings.afterPaymentInst.tr,
                //             style: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space12.sp, color: MyColor.getBodyTextColor()),
                //           ),
                //         ],
                //       ),
                //     )
                //   ],
                // ),

                StepperSection(),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedBtn(text: MyStrings.transferredNotifySeller.tr, onTap: () {}),
                    ),
                    spaceSide(Dimensions.space18.w),
                    TradeButton(
                      onTap: () {},
                      textStyle: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getBodyTextColor()),
                      name: MyStrings.cancel.tr,
                      hasBorder: false,
                    )
                  ],
                ),
                spaceDown(Dimensions.space40.h)
              ],
            ));
  }
}

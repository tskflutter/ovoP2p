import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/wallet_details/wallet_details_controller.dart';
import 'package:ovolutter/data/repo/deposit_r/deposit_repo.dart';

import '../../../data/controller/deposit_c/deposit_controller.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  void initState() {
    Get.put(DepositRepo());
    final controller = Get.put(DepositController(depositRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<DepositController>(
        builder: (controller) => MyCustomScaffold(
            pageTitle: "Deposit Ethereum",
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomRoundedCard(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spaceDown(Dimensions.space10),
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.space5),
                          decoration: BoxDecoration(
                            color: MyColor.lightTwoFaCardColor,
                            borderRadius: BorderRadius.circular(Dimensions.space20),
                          ),
                          child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/250px-QR_code_for_mobile_English_Wikipedia.svg.png", width: 220, height: 220, errorBuilder: (ctx, object, trx) {
                            return Image.asset(
                              MyImages.placeHolderImage,
                              fit: BoxFit.cover,
                              width: 220,
                              height: 220,
                            );
                          }),
                        ),
                      ),
                      spaceDown(Dimensions.space40.h),
                      Container(
                        padding: EdgeInsets.all(Dimensions.space12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), border: Border.all(color: MyColor.getBorderColor())),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyStrings.network,
                                    style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor()),
                                  ),
                                  Text(
                                    "john_doe007",
                                    style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor()),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(Dimensions.space10),
                              decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space8), color: MyColor.getBorderColor().withValues(alpha: .1)),
                              child: MyAssetImageWidget(
                                assetPath: MyImages.arrowBackwardForward,
                                isSvg: true,
                                height: Dimensions.space20.h,
                                width: Dimensions.space20.h,
                              ),
                            )
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space16.h),
                      Container(
                        padding: EdgeInsets.all(Dimensions.space12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), border: Border.all(color: MyColor.getBorderColor())),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyStrings.depositAddress.tr,
                                    style: theme.textTheme.bodySmall?.copyWith(color: MyColor.getBodyTextColor()),
                                  ),
                                  Text(
                                    "3323LyjjWynAe1dMWLEx4DSusss",
                                    style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor()),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(Dimensions.space10),
                              decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space8), color: MyColor.getBorderColor().withValues(alpha: .1)),
                              child: MyAssetImageWidget(
                                assetPath: MyImages.copyWithoutFilled,
                                isSvg: true,
                                height: Dimensions.space20.h,
                                width: Dimensions.space20.h,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  spaceDown(Dimensions.space40.h),
                  CustomElevatedBtn(text: MyStrings.saveAndShareAddress.tr, onTap: () {})
                ],
              ),
            )));
  }
}

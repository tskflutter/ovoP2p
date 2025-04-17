import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/withdrawals/widget/balance_row.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/my_withdrawals/my_withdrawals_controller.dart';
import 'package:ovolutter/data/repo/my_withdrawals/my_withdrawals_repo.dart';
import 'package:show_up_animation/show_up_animation.dart';

class MyWithdrawalsScreen extends StatefulWidget {
  const MyWithdrawalsScreen({super.key});

  @override
  State<MyWithdrawalsScreen> createState() => _MyWithdrawalsScreenState();
}

class _MyWithdrawalsScreenState extends State<MyWithdrawalsScreen> {
  @override
  void initState() {
    Get.put(MyWithdrawalsRepo());
    final controller = Get.put(MyWithdrawalsController(myWithdrawalsRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<MyWithdrawalsController>(
        builder: (controller) => MyCustomScaffold(
            pageTitle: MyStrings.withdrawals.tr,
            body: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: Dimensions.space12.h,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.changeVisiblityStatus(index);
                  },
                  child: CustomRoundedCard(
                      hasPadding: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    MyAssetImageWidget(
                                      assetPath: MyImages.eth,
                                      isSvg: true,
                                      height: 24,
                                      width: 24,
                                    ),
                                    spaceSide(Dimensions.space8.w),
                                    Expanded(
                                      child: Text(
                                        "Ethereum (ETH)",
                                        style: theme.textTheme.headlineSmall?.copyWith(fontSize: Dimensions.space15.sp),
                                      ),
                                    ),
                                    Text(
                                      "Nov 30, 2024 12:37 PM",
                                      style: theme.textTheme.labelSmall?.copyWith(fontSize: Dimensions.space11.sp),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: MyColor.getBorderColor(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("-0.0000458 ETH",
                                            style: theme.textTheme.titleLarge?.copyWith(
                                              color: MyColor.getErrorColor(),
                                            )),
                                        spaceDown(Dimensions.space4.h),
                                        Text("XID: SRGEV452FVBC", style: theme.textTheme.labelSmall?.copyWith(color: MyColor.getBodyTextColor(), fontSize: Dimensions.space15.sp)),
                                      ],
                                    ),
                                    MyAssetImageWidget(
                                      assetPath: MyImages.roundedForward,
                                      isSvg: true,
                                      height: Dimensions.space24.h,
                                      width: Dimensions.space24.h,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: controller.currentIndex == index,
                            child: Divider(color: MyColor.getBorderColor()),
                          ),
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            visible: controller.currentIndex == index,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInOutCubic,
                              opacity: controller.currentIndex == index ? 1 : 0,
                              child: ShowUpAnimation(
                                  direction: Direction.vertical,
                                  curve: Curves.linear,
                                  animationDuration: Duration(milliseconds: 700),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: Dimensions.space5, horizontal: Dimensions.space15),
                                    child: Column(
                                      children: [
                                        BalanceRow(
                                          title: MyStrings.charge.tr,
                                          value: "0.00005478 ETH",
                                        ),
                                        Divider(color: MyColor.getBorderColor()),
                                        BalanceRow(
                                          title: MyStrings.postBalance.tr,
                                          value: "0.00005478 ETH",
                                        ),
                                        Divider(color: MyColor.getBorderColor()),
                                        BalanceRow(
                                          title: MyStrings.status.tr,
                                          value: MyStrings.complete.tr,
                                          isCompleted: true,
                                        ),
                                        spaceDown(Dimensions.space10)
                                      ],
                                    ),
                                  )),
                            ),
                          )
                        ],
                      )),
                );
              },
            )));
  }
}

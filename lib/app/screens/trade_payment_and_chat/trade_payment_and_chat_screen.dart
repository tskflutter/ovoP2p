import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/components/text-field/label_text_field.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/market/widgets/currency_filter_button.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/market/widgets/market_card.dart';
import 'package:ovolutter/app/screens/trade_details/widgets/top_section.dart';
import 'package:ovolutter/app/screens/trade_payment_and_chat/trade_chat_widget/trade_chat.dart';
import 'package:ovolutter/app/screens/trade_payment_and_chat/trade_payment_widgets/trade_payment_details.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/trade_details_and_chat/trade_details_and_chat_controller.dart';
import 'package:ovolutter/data/repo/trade_payment_and_chat/trade_details_and_chat_repo.dart';

class TradePaymentAndChatScreen extends StatefulWidget {
  const TradePaymentAndChatScreen({
    super.key,
  });

  @override
  State<TradePaymentAndChatScreen> createState() => _TradePaymentAndChatScreenState();
}

class _TradePaymentAndChatScreenState extends State<TradePaymentAndChatScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Get.put(TradeDetailsAndChatRepo());
    final controller = Get.put(TradeDetailsAndChatController(tradeDetailsRepo: Get.find()));

    super.initState();
    controller.tabController = TabController(length: 2, vsync: this);

    controller.tabController.addListener(() {
      if (controller.tabController.indexIsChanging) {
        controller.changeIndicator();
      } else if (controller.tabController.index != controller.tabController.previousIndex) {
        controller.changeIndicator();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TradeDetailsAndChatController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {},
        child: controller.isLoading
            ? const CustomLoader()
            : DefaultTabController(
                initialIndex: controller.currentIndex,
                length: 2,
                child: MyCustomScaffold(
                  pageTitle: MyStrings.tradeDetails.tr,
                  body: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            spaceDown(Dimensions.space20.h),
                            Container(
                              padding: EdgeInsets.all(Dimensions.space4.sp),
                              decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), borderRadius: BorderRadius.circular(Dimensions.space12)),
                              child: TabBar(
                                controller: controller.tabController,
                                onTap: (value) {
                                  controller.changeIndicator();
                                },
                                labelPadding: EdgeInsets.all(0),
                                indicatorColor: MyColor.getTransparentColor(),
                                dividerColor: MyColor.transparent,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(gradient: controller.currentIndex == 0 ? LinearGradient(colors: MyColor.cardGradiant) : null, borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            MyAssetImageWidget(
                                              assetPath: MyImages.action,
                                              isSvg: true,
                                              height: Dimensions.space20.h,
                                              width: Dimensions.space20.h,
                                              color: controller.currentIndex == 0 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor(),
                                            ),
                                            spaceSide(Dimensions.space4.w),
                                            Text(
                                              MyStrings.action.tr,
                                              style: theme.textTheme.headlineSmall?.copyWith(color: controller.currentIndex == 0 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(gradient: controller.currentIndex == 1 ? LinearGradient(colors: MyColor.cardGradiant) : null, borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            MyAssetImageWidget(
                                              assetPath: MyImages.chat,
                                              isSvg: true,
                                              height: Dimensions.space20.h,
                                              width: Dimensions.space20.h,
                                              color: controller.currentIndex == 1 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor(),
                                            ),
                                            spaceSide(Dimensions.space4.w),
                                            Text(
                                              MyStrings.message.tr,
                                              style: theme.textTheme.headlineSmall?.copyWith(color: controller.currentIndex == 1 ? MyColor.getHeadingTextColor() : MyColor.getBodyTextColor()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            spaceDown(Dimensions.space10.h),
                          ],
                        ),
                      ),
                    ],
                    body: TabBarView(controller: controller.tabController, children: [
                      TradePaymentDetails(),
                      TradeChat(),
                    ]),
                  ),
                  floatingActionButton: controller.tabController.index == 1
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.space16.w, vertical: Dimensions.space12.h),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(color: MyColor.pcBackground),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(Dimensions.space10.sp),
                                decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), shape: BoxShape.circle),
                                child: MyAssetImageWidget(
                                  assetPath: MyImages.add,
                                  isSvg: true,
                                  height: Dimensions.space20.h,
                                  width: Dimensions.space20.h,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.space4.w, vertical: Dimensions.space11.h),
                                  child: LabelTextField(
                                    fillColor: MyColor.getTransparentColor(),

                                    hideLabel: true,
                                    //   controller: controller.emailController,
                                    labelText: MyStrings.email.tr,
                                    hintText: MyStrings.typeaMessage.tr,
                                    hintTextStyle: theme.textTheme.bodyLarge?.copyWith(fontSize: Dimensions.space15.sp, color: MyColor.getBodyTextColor()),
                                    onChanged: (value) {},
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    // focusNode: controller.emailFocusNode,
                                    // nextFocus: controller.passwordFocusNode,
                                    textInputType: TextInputType.emailAddress,
                                    inputAction: TextInputAction.next,

                                    radius: Dimensions.space100,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return MyStrings.fieldErrorMsg.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: Dimensions.space15),
                                      child: MyAssetImageWidget(
                                        assetPath: MyImages.microphone,
                                        isSvg: true,
                                        height: Dimensions.space20.h,
                                        width: Dimensions.space20.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(Dimensions.space10.sp),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: MyColor.cardGradiant),
                                ),
                                child: Center(
                                  child: MyAssetImageWidget(
                                    assetPath: MyImages.send,
                                    isSvg: true,
                                    height: Dimensions.space20.h,
                                    width: Dimensions.space20.h,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : null,
                ),
              ),
      ),
    );
  }
}

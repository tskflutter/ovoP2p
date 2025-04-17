import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/market/widgets/currency_filter_button.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/trade/widget/running_trade_section.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/trade/trade_controller.dart';
import 'package:ovolutter/data/repo/trade/trade_repo.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({
    super.key,
  });

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Get.put(TradeRepo());
    final controller = Get.put(TradeController(tradeRepo: Get.find()));

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
    return GetBuilder<TradeController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {},
        child: controller.isLoading
            ? const CustomLoader()
            : DefaultTabController(
                initialIndex: controller.currentIndex,
                length: 2,
                child: MyCustomScaffold(
                  showBackButton: false,
                  pageTitle: MyStrings.market.tr,
                  actionButton: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.space15.h),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space12), color: MyColor.pcBackground),
                      child: Stack(
                        children: [
                          MyAssetImageWidget(
                            assetPath: MyImages.notificationBell,
                            isSvg: true,
                            height: Dimensions.space24.h,
                            width: Dimensions.space24.h,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: CircleAvatar(
                              maxRadius: Dimensions.space5,
                              backgroundColor: MyColor.getErrorColor(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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
                                      decoration: BoxDecoration(color: controller.currentIndex == 0 ? MyColor.getSuccessColor() : MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                                      child: Center(
                                        child: Text(
                                          "${MyStrings.runningTrade.tr} (04)",
                                          style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      decoration: BoxDecoration(color: controller.currentIndex == 1 ? MyColor.getErrorColor() : MyColor.getTransparentColor(), borderRadius: BorderRadius.circular(Dimensions.space8.w)),
                                      child: Center(
                                        child: Text(
                                          "${MyStrings.completed.tr} (15)",
                                          style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor()),
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
                      RunningTradeSection(),
                      RunningTradeSection(),
                    ]),
                  ),
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/trade_button.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/user_data.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/market/widgets/currency_filter_button.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/market/widgets/market_card.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/market_controller/market_controller.dart';
import 'package:ovolutter/data/repo/market/market_repo.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({
    super.key,
  });

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Get.put(MarketRepo());
    final controller = Get.put(MarketController(marketRepo: Get.find()));

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
    return GetBuilder<MarketController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {},
        child: controller.isLoading
            ? const CustomLoader()
            : DefaultTabController(
                initialIndex: controller.currentIndex,
                length: 2,
                child: MyCustomScaffold(
                  pageTitle: MyStrings.market.tr,
                  actionButton: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12.sp)),
                          padding: EdgeInsets.all(Dimensions.space12),
                          child: MyAssetImageWidget(
                            assetPath: MyImages.search,
                            isSvg: true,
                            height: Dimensions.space24.h,
                            width: Dimensions.space24.h,
                          ),
                        ),
                        spaceSide(Dimensions.space8.w),
                        Container(
                          decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12.sp)),
                          padding: EdgeInsets.all(Dimensions.space12),
                          child: MyAssetImageWidget(
                            assetPath: MyImages.slice,
                            isSvg: true,
                            height: Dimensions.space24.h,
                            width: Dimensions.space24.h,
                          ),
                        ),
                        spaceSide(Dimensions.space8.w),
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Container(
                            decoration: BoxDecoration(color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space12.sp)),
                            padding: EdgeInsets.all(Dimensions.space12),
                            child: MyAssetImageWidget(
                              assetPath: MyImages.smallFilter,
                              isSvg: true,
                              height: Dimensions.space24.h,
                              width: Dimensions.space24.h,
                            ),
                          ),
                        ),
                        spaceSide(Dimensions.space8.w),
                      ],
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
                                          MyStrings.buy.tr,
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
                                          MyStrings.sell.tr,
                                          style: theme.textTheme.headlineSmall?.copyWith(color: MyColor.getHeadingTextColor()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            spaceDown(Dimensions.space10.h),
                            CurrencyFilterButton()
                          ],
                        ),
                      ),
                    ],
                    body: TabBarView(controller: controller.tabController, children: [
                      ListView.builder(itemCount: 10, itemBuilder: (context, index) => MarketCard()),
                      ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => MarketCard(
                                isSell: true,
                              )),
                    ]),
                  ),
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/active_trade_section.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/available_trade_section.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/user_data.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/wallet_section.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/home/home_controller.dart';
import 'package:ovolutter/data/repo/home/home_repo.dart';

import 'widget/kyc_warning_section.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> bottomNavScaffoldKey;
  const HomeScreen({
    super.key,
    required this.bottomNavScaffoldKey,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(HomeRepo());
    final controller = Get.put(HomeController(homeRepo: Get.find()));
    controller.isLoading = true;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
      controller.initialData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<HomeController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          await controller.initialData(shouldLoad: false);
          await controller.initialData(shouldLoad: false);
          await controller.initialData(shouldLoad: false);
          await controller.initialData(shouldLoad: false);
          await controller.initialData(shouldLoad: false);
          await controller.initialData(shouldLoad: false);
          await controller.initialData(shouldLoad: false);
        },
        child: controller.isLoading
            ? const CustomLoader()
            : Scaffold(
                backgroundColor: MyColor.getBackgroundColor(),
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: Dimensions.screenPadding,
                        child: Column(
                          children: [
                            spaceDown(Dimensions.space20.h),
                            Row(
                              children: [
                                Expanded(
                                  child: UserBio(
                                    name: "John Doe",
                                    email: "john_doe000@gmail.com",
                                  ),
                                ),
                                Stack(
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
                                )
                              ],
                            ),
                            spaceDown(Dimensions.space24.h),
                            KYCWarningSection(controller: controller),
                            WalletSection(),
                            spaceDown(Dimensions.space24.h),
                            ActiveTradeSection(),
                          ],
                        ),
                      ),
                    ),
                  ],
                  body: ListView(
                    children: [
                      AvailableTradeSection(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

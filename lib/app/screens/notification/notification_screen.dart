import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/advance_switch/custom_switch.dart';
import 'package:ovolutter/app/components/card/custom_rounded_card.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/screens/notification/widgets/status_row.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/repo/notification_repo/notification_repo.dart';

import '../../../data/controller/notifications/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _controller = ScrollController();

  fetchData() {
    Get.find<NotificationsController>().initData();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (Get.find<NotificationsController>().hasNext()) {
        fetchData();
      }
    }
  }

  @override
  void initState() {
    Get.put(NotificationRepo());
    final controller = Get.put(NotificationsController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.page = 0;
      controller.clearActiveNotificationInfo();
      _controller.addListener(_scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MyCustomScaffold(
        pageTitle: MyStrings.notification.tr,
        body: GetBuilder<NotificationsController>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomRoundedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyStrings.tradeNotification.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                            ),
                            spaceDown(Dimensions.space9.h),
                            StatusRow(
                              title: MyStrings.newTradeRequest.tr,
                              status: controller.newTradeRequest,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.paymentUpdate.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.escrowReleaseUpdates.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space16.h),
                      CustomRoundedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyStrings.walletNotification.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                            ),
                            spaceDown(Dimensions.space9.h),
                            StatusRow(
                              title: MyStrings.newTradeRequest.tr,
                              status: controller.newTradeRequest,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.paymentUpdate.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space16.h),
                      CustomRoundedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyStrings.tradeNotification.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                            ),
                            spaceDown(Dimensions.space9.h),
                            StatusRow(
                              title: MyStrings.newTradeRequest.tr,
                              status: controller.newTradeRequest,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.paymentUpdate.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.escrowReleaseUpdates.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space16.h),
                      CustomRoundedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyStrings.walletNotification.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                            ),
                            spaceDown(Dimensions.space9.h),
                            StatusRow(
                              title: MyStrings.newTradeRequest.tr,
                              status: controller.newTradeRequest,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.paymentUpdate.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space16.h),
                      CustomRoundedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyStrings.tradeNotification.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                            ),
                            spaceDown(Dimensions.space9.h),
                            StatusRow(
                              title: MyStrings.newTradeRequest.tr,
                              status: controller.newTradeRequest,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.paymentUpdate.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.escrowReleaseUpdates.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                      spaceDown(Dimensions.space16.h),
                      CustomRoundedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              MyStrings.walletNotification.tr,
                              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                            ),
                            spaceDown(Dimensions.space9.h),
                            StatusRow(
                              title: MyStrings.newTradeRequest.tr,
                              status: controller.newTradeRequest,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                            Divider(
                              height: Dimensions.space24.h,
                              color: MyColor.getBorderColor(),
                            ),
                            StatusRow(
                              title: MyStrings.paymentUpdate.tr,
                              status: controller.paymentUpdate,
                              onTap: (value) {
                                controller.changeStatus();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}

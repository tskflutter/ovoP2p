import 'package:flutter/material.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/data/repo/notification_repo/notification_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/no_notification_screen.dart';
import 'package:get/get.dart';

import '../../../core/helper/date_converter.dart';
import '../../../core/utils/my_color.dart';
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
      controller.initData();
      controller.clearActiveNotificationInfo();
      _controller.addListener(_scrollListener);
    });
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: const CustomAppBar(title: MyStrings.myNotifications),
      body: GetBuilder<NotificationsController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(12),
          child: RefreshIndicator(
            color: MyColor.getPrimaryColor(),
            backgroundColor: MyColor.getBackgroundColor(),
            onRefresh: () async {
              controller.page = 0;
              await controller.initData();
            },
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: controller.isLoading ? const CustomLoader()
                    : controller.notificationList.isEmpty?const NoNotificationScreen():ListView.builder(
                        controller: _controller,
                        itemCount: controller.notificationList.length+1,
                        itemBuilder: (context, index) {

                          if (controller
                              .notificationList.length ==
                              index) {
                            return controller.hasNext()
                                ?  Center(
                                child:
                                CircularProgressIndicator(color: MyColor.getPrimaryColor(),))
                                : const SizedBox();
                          }
                          bool isNotRead=controller.notificationList[index].userRead ==
                              '0';
                         // String remarks=controller.notificationList[index].remark??'';
                          return GestureDetector(
                              onTap: () {
                                controller.markAsReadAndGotoThePage(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: MyColor.getBorderColor(),width: .5),
                                    color: isNotRead
                                        ? MyColor.getBorderColor()
                                        : MyColor.white),
                                child: ListTile(
                                  title: Text(controller.notificationList[index].message ?? "",
                                    style: regularDefault.copyWith(color: MyColor.black),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text(
                                            DateConverter.isoStringToLocalFormattedDateOnly(
                                                controller.notificationList[index]
                                                        .createdAt ??
                                                    '0'),
                                            style: regularSmall.copyWith(color: MyColor.getHeadingTextColor()),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );})),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ovolutter/core/helper/date_converter.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/ticket_helper.dart';
import 'package:ovolutter/data/controller/support/support_controller.dart';
import 'package:ovolutter/data/repo/support/support_repo.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/app/components/floating_action_button/fab.dart';
import 'package:ovolutter/app/components/no_support_ticket_screen.dart';
import 'package:ovolutter/app/screens/ticket/all_ticket_screen/widget/all_ticket_list_item.dart';
import 'package:get/get.dart';

import '../../../components/shimmer/all_ticket_shimmer.dart';

class AllTicketScreen extends StatefulWidget {
  const AllTicketScreen({super.key});

  @override
  State<AllTicketScreen> createState() => _AllTicketScreenState();
}

class _AllTicketScreenState extends State<AllTicketScreen> {
  ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (Get.find<SupportController>().hasNext()) {
        Get.find<SupportController>().getSupportTicket();
      }
    }
  }

  @override
  void initState() {
    
    Get.put(SupportRepo());
    final controller = Get.put(SupportController(repo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<SupportController>(builder: (controller) {
      return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: const CustomAppBar(title: MyStrings.supportTicket),
        body: RefreshIndicator(
            onRefresh: () async {
              controller.loadData();
            },
            color: MyColor.black,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              padding: Dimensions.defaultPaddingHV,
              child: controller.isLoading ?
              ListView.separated(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context,index) => Container(margin: const EdgeInsets.only(bottom: Dimensions.space10)),
                  itemBuilder: (BuildContext context, int index) {
                    return const TicketShimmer();
                  }) : controller.ticketList.isEmpty ?
              const Center(child: NoSupportTicketScreen()) :
              ListView.separated(
                controller: scrollController,
                itemCount: controller.ticketList.length + 1,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                itemBuilder: (context, index) {
                  if (controller.ticketList.length == index) {
                    return controller.hasNext()
                        ? const CustomLoader(isPagination: true)
                        : const SizedBox();
                  }
                  return GestureDetector(
                      onTap: () {
                        String id = controller.ticketList[index].ticket ?? '-1';
                        String subject = controller.ticketList[index].subject ?? '';
                        Get.toNamed(RouteHelper.ticketDetailsScreen, arguments: [id, subject]);
                      },
                      child: AllTicketListItem(
                          ticketNumber: controller.ticketList[index].ticket ?? '',
                          subject: controller.ticketList[index].subject ?? '',
                          status: TicketHelper.getStatusText(controller.ticketList[index].status ?? '0'),
                          priority: TicketHelper.getPriorityText(controller.ticketList[index].priority ?? '0'),
                          statusColor: TicketHelper.getStatusColor(controller.ticketList[index].status ?? '0'),
                          priorityColor: TicketHelper.getPriorityColor(controller.ticketList[index].priority ?? '0'),
                          time: DateConverter.getFormatedSubtractTime(controller.ticketList[index].createdAt ?? '')
                      )
                  );
                },
              ),
            )),
        floatingActionButton: FAB(
          callback: () {
            Get.toNamed(RouteHelper.newTicketScreen)?.then(
                    (value) => {



                  if(value != null && value == 'updated'){
                    controller.getSupportTicket()
                  }
                });
          },
        ),
      );
    });
  }
}
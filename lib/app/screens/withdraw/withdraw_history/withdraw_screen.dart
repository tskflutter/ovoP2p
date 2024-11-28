import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/custom_loader/custom_loader.dart';
import 'package:ovolutter/core/helper/string_format_helper.dart';
import 'package:ovolutter/data/controller/withdraw/withdraw_history_controller.dart';
import 'package:ovolutter/data/repo/withdraw/withdraw_history_repo.dart';
import 'package:ovolutter/app/components/custom_no_data_found_class.dart';
import 'package:get/get.dart';
import '../../../../core/helper/date_converter.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';

import '../widget/custom_withdraw_card.dart';
import '../widget/withdraw_bottom_sheet.dart';
import '../widget/withdraw_history_top.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final ScrollController scrollController = ScrollController();

  void scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (Get.find<WithdrawHistoryController>().hasNext()) {
        Get.find<WithdrawHistoryController>().loadPaginationData();
      }
    }
  }

  @override
  void initState() {
    
    Get.put(WithdrawHistoryRepo());
    final controller = Get.put(WithdrawHistoryController(withdrawHistoryRepo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.initData();
      scrollController.addListener(scrollListener);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<WithdrawHistoryController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          title: MyStrings.withdraw.tr,
          action: [
            GestureDetector(
              onTap: () {
                controller.changeSearchStatus();
              },
              child: Container(
                padding: const EdgeInsets.all(Dimensions.space7),
                decoration: BoxDecoration(color: MyColor.white, shape: BoxShape.circle),
                child: Icon(controller.isSearch ? Icons.clear : Icons.search, color: MyColor.getPrimaryColor(), size: 15),
              ),
            ),
            const SizedBox(width: Dimensions.space7),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.addWithdrawMethodScreen);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 7, right: 10, bottom: 7, top: 7),
                padding: const EdgeInsets.all(Dimensions.space7),
                decoration: BoxDecoration(color: MyColor.white, shape: BoxShape.circle),
                child: Icon(Icons.add, color: MyColor.getPrimaryColor(), size: 15),
              ),
            ),
            const SizedBox(width: Dimensions.space15),
          ],
        ),
        body: controller.isLoading
            ? const CustomLoader()
            : Padding(
                padding: const EdgeInsets.only(top: Dimensions.space20, left: Dimensions.space15, right: Dimensions.space15),
                child: Column(
                  children: [
                    Visibility(
                      visible: controller.isSearch,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WithdrawHistoryTop(),
                          SizedBox(height: Dimensions.space10),
                        ],
                      ),
                    ),
                    Expanded(
                      child: controller.withdrawList.isEmpty && controller.filterLoading == false
                          ? const Center(
                              child: NoDataOrInternetScreen(),
                            )
                          : controller.filterLoading
                              ? const CustomLoader()
                              : SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const BouncingScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    itemCount: controller.withdrawList.length + 1,
                                    controller: scrollController,
                                    separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
                                    itemBuilder: (context, index) {
                                      if (index == controller.withdrawList.length) {
                                        return controller.hasNext() ? const CustomLoader(isPagination: true) : const SizedBox();
                                      }
                                      return CustomWithdrawCard(
                                        onPressed: () {
                                          WithdrawBottomSheet().withdrawBottomSheet(index, context, controller.currency);
                                        },
                                        trxValue: controller.withdrawList[index].trx ?? "",
                                        date: DateConverter.isoToLocalDateAndTime(controller.withdrawList[index].createdAt ?? ""),
                                        status: controller.getStatus(index),
                                        statusBgColor: controller.getColor(index),
                                        amount: "${AppConverter.formatNumber(controller.withdrawList[index].finalAmount ?? " ")} ${controller.currency}",
                                      );
                                    },
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

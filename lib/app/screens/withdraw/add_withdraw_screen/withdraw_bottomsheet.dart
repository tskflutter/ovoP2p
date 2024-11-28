import 'package:flutter/material.dart';
import 'package:ovolutter/core/helper/string_format_helper.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/style.dart';
import 'package:ovolutter/core/utils/url_container.dart';
import 'package:ovolutter/core/utils/util.dart';
import 'package:ovolutter/data/controller/deposit/add_new_deposit_controller.dart';
import 'package:ovolutter/data/controller/withdraw/add_new_withdraw_controller.dart';
import 'package:ovolutter/data/model/withdraw/withdraw_preview_response_model.dart';
import 'package:ovolutter/app/components/bottom-sheet/bottom_sheet_bar.dart';
import 'package:ovolutter/app/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:ovolutter/app/components/bottom-sheet/custom_bottom_sheet_plus.dart';
import 'package:ovolutter/app/components/card/bottom_sheet_card.dart';
import 'package:ovolutter/app/components/image/my_image_widget.dart';

class WithdrawBottomsheet {
  static void withdrawBottomSheet(BuildContext context, AddNewWithdrawController controller) {
    ThemeData theme = Theme.of(context);
    CustomBottomSheetPlus(
      isDismissable: false,
      enableDrag: false,
      bgColor: Colors.grey.withOpacity(.2),
      isNeedPadding: false,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height * .6,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
              color: MyColor.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: MyUtils.getShadow(),
            ),
            child: Column(
              children: [
                const Stack(
                  children: [
                    BottomSheetBar(),
                    Align(alignment: Alignment.centerRight, child: BottomSheetCloseButton()),
                  ],
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: ListView.builder(
                      itemCount: controller.withdrawMethodList.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectedPaymentMethodController.text = controller.withdrawMethodList[index].name ?? '';
                            controller.setWithdrawMethod(controller.withdrawMethodList[index]);
                            Navigator.pop(context);
                            FocusScopeNode currentFocus = FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          child: controller.withdrawMethodList[index].id == -1
                              ? const SizedBox.shrink()
                              : BottomSheetCard(
                                  bottomSpace: Dimensions.space10,
                                  bgColor: theme.cardColor,
                                  boxShadow: const [],
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${controller.withdrawMethodList[index].name}'.toCapitalized(),
                                          style: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.only(end: Dimensions.space10),
                                        child: MyImageWidget(
                                          imageUrl: ("${UrlContainer.withDrawImagePath}${controller.withdrawMethodList[index].image}"),
                                          height: Dimensions.space30,
                                          width: Dimensions.space40 + 10,
                                          boxFit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
    ).show(context);
  }
}

import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/widget/delete_account_bottom_sheet_body.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/widget/menu_card_widget.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';

import 'package:ovolutter/data/controller/menu/my_menu_controller.dart';
import 'package:ovolutter/data/repo/auth/general_setting_repo.dart';
import 'package:ovolutter/data/repo/menu_repo/menu_repo.dart';
import 'package:ovolutter/app/components/divider/custom_divider.dart';
import 'package:ovolutter/app/components/will_pop_widget.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/widget/menu_item.dart';

import '../../../components/bottom-sheet/custom_bottom_sheet.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    Get.put(GeneralSettingRepo());
    Get.put(MenuRepo());
    final controller = Get.put(MyMenuController(menuRepo: Get.find(), repo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<MyMenuController>(
        builder: (menuController) => WillPopWidget(
            nextRoute: RouteHelper.bottomNavBar,
            child: Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: const CustomAppBar(title: MyStrings.menu),
              body: GetBuilder<MyMenuController>(
                builder: (controller) => SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.space12, horizontal: Dimensions.space15),
                  child: Column(children: [
                    MenuCardWidget(
                      child: Column(
                        children: [
                          MenuItems(imageSrc: MyImages.usesPofile, label: MyStrings.profile.tr, onPressed: () => Get.toNamed(RouteHelper.profileScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.changePassword, label: MyStrings.changePassword, onPressed: () => Get.toNamed(RouteHelper.changePasswordScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.twoFactorAuth, label: MyStrings.twoFactorAuth, onPressed: () => Get.toNamed(RouteHelper.twoFactorSetupScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.notification, label: MyStrings.notifications, onPressed: () => Get.toNamed(RouteHelper.notificationScreen)),
                        ],
                      ),
                    ),
                    MenuCardWidget(
                      child: Column(
                        children: [
                          MenuItems(imageSrc: MyImages.deposit, label: MyStrings.deposit, onPressed: () => Get.toNamed(RouteHelper.depositsHistoryScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          Visibility(
                              visible: menuController.isWithdrawEnable,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MenuItems(imageSrc: MyImages.withdraw, label: MyStrings.withdraw.tr, onPressed: () => Get.toNamed(RouteHelper.withdrawScreen)),
                                  CustomDivider(
                                    space: Dimensions.space10,
                                  ),
                                ],
                              )),
                          MenuItems(imageSrc: MyImages.transaction, label: MyStrings.transaction.tr, onPressed: () => Get.toNamed(RouteHelper.transactionHistoryScreen)),
                        ],
                      ),
                    ),
                    MenuCardWidget(
                        child: Column(
                      children: [
                        Visibility(
                            visible: menuController.langSwitchEnable,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MenuItems(
                                  imageSrc: MyImages.language,
                                  label: MyStrings.language.tr,
                                  onPressed: () {
                                    Get.toNamed(RouteHelper.languageScreen);
                                  },
                                ),
                                CustomDivider(
                                  space: Dimensions.space10,
                                ),
                              ],
                            )),
                        MenuItems(
                          imageSrc: MyImages.faq,
                          label: MyStrings.faq.tr,
                          onPressed: () {
                            Get.toNamed(RouteHelper.faqScreen);
                          },
                        ),
                        CustomDivider(
                          space: Dimensions.space10,
                        ),
                        MenuItems(
                            imageSrc: MyImages.support,
                            label: MyStrings.supportTicket.tr,
                            onPressed: () {
                              Get.toNamed(RouteHelper.allTicketScreen);
                            }),
                        CustomDivider(
                          space: Dimensions.space10,
                        ),
                        MenuItems(
                            imageSrc: MyImages.policy,
                            label: MyStrings.privacyPolicy.tr,
                            onPressed: () {
                              Get.toNamed(RouteHelper.privacyScreen);
                            }),
                      ],
                    )),
                    MenuCardWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MenuItems(
                              imageSrc: MyImages.deleteAccount,
                              label: MyStrings.deleteAccount.tr,
                              onPressed: () {
                                CustomBottomSheet(
                                  isNeedMargin: true,
                                  child: const DeleteAccountBottomsheetBody(),
                                ).customBottomSheet(context);
                              }),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          controller.logoutLoading
                              ? Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(color: MyColor.getPrimaryColor(), strokeWidth: 2.00),
                                  ),
                                )
                              : MenuItems(imageSrc: MyImages.logout, label: MyStrings.logout.tr, onPressed: () => controller.logout()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Dimensions.space100,
                    )
                  ]),
                ),
              ),
            )));
  }
}

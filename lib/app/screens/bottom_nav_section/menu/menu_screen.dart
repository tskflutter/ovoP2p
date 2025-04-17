import 'package:flutter/material.dart';
import 'package:ovolutter/app/components/app-bar/custom_appbar.dart';
import 'package:ovolutter/app/components/card/my_custom_scaffold.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/home/widgets/user_data.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/widget/delete_account_bottom_sheet_body.dart';
import 'package:ovolutter/app/screens/bottom_nav_section/menu/widget/menu_card_widget.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_images.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';

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
            child: MyCustomScaffold(
              showAppBar: false,
              body: GetBuilder<MyMenuController>(
                builder: (controller) => SingleChildScrollView(
                  child: Column(children: [
                    spaceDown(Dimensions.space100),
                    Container(
                      padding: EdgeInsets.all(Dimensions.space16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space20), border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground),
                      child: Row(
                        children: [
                          Expanded(child: UserBio(name: "John Doe", email: "@john_doe007")),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.space100), color: MyColor.getSuccessColor().withValues(alpha: .3)),
                            padding: EdgeInsets.symmetric(vertical: Dimensions.space7, horizontal: Dimensions.space20),
                            child: Center(
                              child: Text(MyStrings.verified.tr,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: MyColor.getSuccessColor(),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    spaceDown(Dimensions.space16.h),
                    MenuCardWidget(
                      child: Column(
                        children: [
                          MenuItems(imageSrc: MyImages.profileRounded, label: MyStrings.profile.tr, onPressed: () => Get.toNamed(RouteHelper.profileScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.changePassword, label: MyStrings.changePassword, onPressed: () => Get.toNamed(RouteHelper.changePasswordScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.kyc, label: MyStrings.kycVerification, onPressed: () => Get.toNamed(RouteHelper.changePasswordScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.twoFa, label: MyStrings.twoFactorAuth, onPressed: () => Get.toNamed(RouteHelper.twoFactorSetupScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          MenuItems(imageSrc: MyImages.notificationSvg, label: MyStrings.notifications, onPressed: () => Get.toNamed(RouteHelper.notificationScreen)),
                        ],
                      ),
                    ),
                    MenuCardWidget(
                      child: Column(
                        children: [
                          MenuItems(imageSrc: MyImages.deposit, label: MyStrings.depositHistory.tr, onPressed: () => Get.toNamed(RouteHelper.depositScreen)),
                          CustomDivider(
                            space: Dimensions.space10,
                          ),
                          Visibility(
                              visible: menuController.isWithdrawEnable,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MenuItems(imageSrc: MyImages.withdraw, label: MyStrings.myWithdrawals.tr, onPressed: () => Get.toNamed(RouteHelper.myWithdrawalsScreen)),
                                  CustomDivider(
                                    space: Dimensions.space10,
                                  ),
                                ],
                              )),
                          //  MenuItems(imageSrc: MyImages.transaction, label: MyStrings.transaction.tr, onPressed: () => Get.toNamed(RouteHelper.wi)),
                          // CustomDivider(
                          //   space: Dimensions.space10,
                          // ),
                          MenuItems(imageSrc: MyImages.ads, label: MyStrings.advertisement.tr, onPressed: () => Get.toNamed(RouteHelper.advertisingScreen)),
                          // CustomDivider(
                          //   space: Dimensions.space10,
                          // ),
                          // MenuItems(imageSrc: MyImages.refferal, label: MyStrings.refferal.tr, onPressed: () => Get.toNamed(RouteHelper.ref)),
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
                            label: MyStrings.policies.tr,
                            onPressed: () {
                              Get.toNamed(RouteHelper.privacyScreen);
                            }),
                        CustomDivider(
                          space: Dimensions.space10,
                        ),
                        MenuItems(
                            imageSrc: MyImages.logout,
                            label: MyStrings.logout.tr,
                            onPressed: () {
                              controller.logout();
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

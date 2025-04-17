import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/annotated_region/annotated_region_widget.dart';
import 'package:ovolutter/app/components/card/custom_app_card.dart';
import 'package:ovolutter/app/components/image/my_asset_widget.dart';

import '../../../core/utils/util_exporter.dart';

class MyCustomScaffold extends StatelessWidget {
  MyCustomScaffold({super.key, this.pageTitle = "PageTitle", this.actionButton, this.showBackButton = true, this.showAppBar = true, this.body, this.appBarBgColor, this.screenBgColor, this.padding, this.demo = false, this.onBackButtonTap, this.floatingActionButton, this.centerTitle = false});
  final String? pageTitle;
  final List<Widget>? actionButton;
  final Widget? body;
  final Color? appBarBgColor;
  final Color? screenBgColor;
  final EdgeInsetsGeometry? padding;
  final bool demo;
  final bool centerTitle;
  final bool showAppBar;
  final bool showBackButton;
  final VoidCallback? onBackButtonTap;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AnnotatedRegionWidget(
      statusBarColor: appBarBgColor ?? MyColor.getPrimaryColor(),
      systemNavigationBarColor: MyColor.getPrimaryColor(),
      child: Scaffold(
        backgroundColor: MyColor.getBackgroundColor(),
        appBar: showAppBar
            ? PreferredSize(
                preferredSize: Size.fromHeight(60.0.h), // here the desired height(
                child: AppBar(
                  surfaceTintColor: MyColor.transparent,
                  centerTitle: centerTitle,
                  backgroundColor: appBarBgColor ?? MyColor.getBackgroundColor(),
                  leading: showBackButton
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GestureDetector(
                              onTap: () {
                                if (onBackButtonTap != null) {
                                  onBackButtonTap!();
                                } else {
                                  Get.back();
                                }
                              },
                              child: MyAssetImageWidget(height: Dimensions.space24.h, width: Dimensions.space24.h, assetPath: MyImages.backRounded, isSvg: true)))
                      : SizedBox.shrink(),
                  titleSpacing: 0,
                  title: Text(
                    "$pageTitle",
                    style: theme.appBarTheme.titleTextStyle,
                  ),
                  actions: [
                    if (actionButton != null) ...[
                      ...actionButton!,
                    ],

                    //TODO Text Button
                    if (demo == true && actionButton == null)
                      TextButton(
                        style: TextButton.styleFrom(
                          overlayColor: MyColor.getPrimaryColor(), // Text color
                          textStyle: TextStyle(
                            fontSize: Dimensions.fontLarge,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: MyColor.getPrimaryColor(),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Demo Skip Button",
                          style: theme.textTheme.bodyMedium,
                        ),
                      )
                  ],
                  elevation: 0,
                ),
              )
            : null,
        body: Padding(
          padding: padding ??
              EdgeInsetsDirectional.symmetric(
                horizontal: Dimensions.space16.w,
              ),
          child: body,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}

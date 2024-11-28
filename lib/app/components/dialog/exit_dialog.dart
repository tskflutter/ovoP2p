import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/rounded_button.dart';
import 'package:ovolutter/core/utils/dimensions.dart';
import 'package:ovolutter/core/utils/my_color.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/style.dart';

showExitDialog(BuildContext context) {
  ThemeData theme = Theme.of(context);
  AwesomeDialog(
    padding: const EdgeInsets.symmetric(vertical: Dimensions.space10),
    context: context,
    dialogType: DialogType.noHeader,
    dialogBackgroundColor: theme.cardColor,
    width: MediaQuery.of(context).size.width,
    buttonsBorderRadius: BorderRadius.circular(Dimensions.defaultRadius),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    onDismissCallback: (type) {},
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: MyStrings.exitTitle.tr,
    titleTextStyle: regularLarge.copyWith(color: MyColor.black, fontWeight: FontWeight.w600),
    showCloseIcon: false,
    btnCancel: RoundedButton(
      text: MyStrings.no.tr,
      press: () {
        Navigator.pop(context);
      },
      horizontalPadding: 3,
      verticalPadding: 3,
      color: MyColor.getBodyTextColor(),
    ),
    btnOk: RoundedButton(
        text: MyStrings.yes.tr,
        press: () {
          SystemNavigator.pop();
        },
        horizontalPadding: 3,
        verticalPadding: 3,
        color: MyColor.getErrorColor(),
        textColor: MyColor.white),
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      SystemNavigator.pop();
    },
  ).show();
}

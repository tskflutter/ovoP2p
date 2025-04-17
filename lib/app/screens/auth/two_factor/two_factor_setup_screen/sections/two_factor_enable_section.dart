import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/app/components/buttons/custom_elevated_button.dart';
import 'package:ovolutter/app/screens/auth/two_factor/two_factor_setup_screen/widget/enable_qr_code_widget.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/controller/auth/two_factor_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TwoFactorEnableSection extends StatelessWidget {
  const TwoFactorEnableSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GetBuilder<TwoFactorController>(builder: (twoFactorController) {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
              decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MyStrings.preventWidespreadCyberAttacksWithSimple2Fa.tr,
                    style: theme.textTheme.labelLarge?.copyWith(color: MyColor.getHeadingTextColor()),
                  ),
                  spaceDown(Dimensions.space12),
                  Text(
                    MyStrings.step1.tr,
                    style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                  ),
                  Text(
                    MyStrings.openAuthenticatorandChooseScanQrCode.tr,
                    style: theme.textTheme.labelLarge?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                  ),
                  const SizedBox(
                    height: Dimensions.space17,
                  ),
                  if (twoFactorController.twoFactorCodeModel.data?.qrCodeUrl != null) ...[EnableQRCodeWidget(qrImage: twoFactorController.twoFactorCodeModel.data?.qrCodeUrl ?? '', secret: "${twoFactorController.twoFactorCodeModel.data?.secret}")]
                ],
              ),
            ),
            spaceDown(Dimensions.space16.h),

            // enable

            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
                decoration: BoxDecoration(border: Border.all(color: MyColor.getBorderColor()), color: MyColor.pcBackground, borderRadius: BorderRadius.circular(Dimensions.space20)),
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    MyStrings.step2.tr,
                    style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700, color: MyColor.getSecondaryColor()),
                  ),
                  Text(
                    MyStrings.enterSixDigitCodeInAuthenticator.tr,
                    style: theme.textTheme.labelLarge?.copyWith(fontSize: Dimensions.space13.sp, color: MyColor.getBodyTextColor()),
                  ),
                  const SizedBox(height: Dimensions.space20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: regularDefault.copyWith(color: MyColor.getHeadingTextColor()),
                      length: 6,
                      textStyle: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
                      obscureText: false,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(shape: PinCodeFieldShape.box, borderWidth: 1, borderRadius: BorderRadius.circular(Dimensions.space12), fieldHeight: 55, fieldWidth: 44, inactiveColor: MyColor.getBorderColor(), inactiveFillColor: MyColor.getTransparentColor(), activeFillColor: MyColor.getTransparentColor(), activeColor: MyColor.getSecondaryColor(), selectedFillColor: MyColor.getTransparentColor(), selectedColor: MyColor.getSecondaryColor()),
                      cursorColor: MyColor.white,
                      animationDuration: const Duration(milliseconds: 100),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      beforeTextPaste: (text) {
                        return true;
                      },
                      onChanged: (value) {
                        twoFactorController.currentText = value;
                        twoFactorController.update();
                      },
                    ),
                  ),
                  const SizedBox(height: Dimensions.space30),
                  Row(
                    children: [
                      Text(
                        MyStrings.didNotReceiveCode,
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, decoration: TextDecoration.underline),
                      ),
                      spaceSide(Dimensions.space5.w),
                      Text(
                        MyStrings.resendCode,
                        style: theme.textTheme.bodyMedium?.copyWith(color: MyColor.getBodyTextColor()),
                      ),
                    ],
                  ),
                ])),
            spaceDown(Dimensions.space25.h),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedBtn(
                    hasGradiant: false,
                    bgColor: MyColor.getBodyTextColor().withValues(alpha: .25),
                    isLoading: twoFactorController.submitLoading,
                    onTap: () {
                      twoFactorController.enable2fa(twoFactorController.twoFactorCodeModel.data?.secret ?? '', twoFactorController.currentText);
                    },
                    textColor: MyColor.getBodyTextColor(),
                    text: MyStrings.cancel.tr,
                  ),
                ),
                spaceSide(Dimensions.space10.w),
                Expanded(
                  flex: 2,
                  child: CustomElevatedBtn(
                    isLoading: twoFactorController.submitLoading,
                    onTap: () {
                      twoFactorController.enable2fa(twoFactorController.twoFactorCodeModel.data?.secret ?? '', twoFactorController.currentText);
                    },
                    text: MyStrings.enable2Fa.tr,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ovolutter/core/utils/style.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';

class OTPFieldWidget extends StatelessWidget {
  const OTPFieldWidget({super.key, required this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space30),
      child: PinCodeTextField(
        appContext: context,
        pastedTextStyle: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
        length: 6,
        textStyle: regularDefault.copyWith(color: MyColor.getBodyTextColor()),
        obscureText: false,
        obscuringCharacter: '*',
        blinkWhenObscuring: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(shape: PinCodeFieldShape.box, borderWidth: .5, borderRadius: BorderRadius.circular(Dimensions.space12), fieldHeight: Dimensions.space55.h, fieldWidth: Dimensions.space45.w, inactiveColor: MyColor.getBorderColor(), inactiveFillColor: MyColor.getTransparentColor(), activeFillColor: MyColor.getTransparentColor(), activeColor: MyColor.getSecondaryColor(), selectedFillColor: MyColor.getTransparentColor(), selectedColor: MyColor.getSecondaryColor()),
        cursorColor: MyColor.getPrimaryColor(),
        animationDuration: const Duration(milliseconds: 100),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        beforeTextPaste: (text) {
          return true;
        },
        onChanged: (value) => onChanged!(value),
      ),
    );
  }
}

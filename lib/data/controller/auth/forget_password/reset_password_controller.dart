
import 'package:flutter/cupertino.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/model/auth/verification/email_verification_model.dart';
import 'package:ovolutter/data/model/model/error_model.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';

class ResetPasswordController extends GetxController {
  LoginRepo loginRepo;

  String email = '';
  String code = '';
  bool submitLoading = false;

  ResetPasswordController({required this.loginRepo}) {
     //TODO
    // checkPasswordStrength = loginRepo.apiClient.getPasswordStrengthStatus();
  }

  bool checkPasswordStrength = false;

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  void resetPassword() async {
    String password = passController.text;
    submitLoading = true;
    update();

    ResponseModel responseModel = await loginRepo.resetPassword(email, password, code);
    if (responseModel.statusCode == 200) {
      EmailVerificationModel model = EmailVerificationModel.fromJson(responseModel.responseJson);
      if (model.status == 'success') {
        CustomSnackBar.success(successList: model.message ?? [MyStrings.requestSuccess]);
        SharedPreferenceService.remove(SharedPreferenceService.resetPassTokenKey);

        Get.offAndToNamed(RouteHelper.loginScreen);
      } else {
        CustomSnackBar.success(successList: model.message ?? [MyStrings.requestFail]);
      }
    } else {
      CustomSnackBar.success(successList: [responseModel.message]);
    }

    submitLoading = false;
    update();
  }

  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>]).{6,}$');

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return MyStrings.enterYourPassword_.tr;
    } else {
      if (checkPasswordStrength) {
        if (!regex.hasMatch(value)) {
          return MyStrings.invalidPassMsg.tr;
        } else {
          return null;
        }
      } else {
        return null;
      }
    }
  }

  List<ErrorModel> passwordValidationRules = [
    ErrorModel(text: MyStrings.hasUpperLetter.tr, hasError: true),
    ErrorModel(text: MyStrings.hasLowerLetter.tr, hasError: true),
    ErrorModel(text: MyStrings.hasDigit.tr, hasError: true),
    ErrorModel(text: MyStrings.hasSpecialChar.tr, hasError: true),
    ErrorModel(text: MyStrings.minSixChar.tr, hasError: true),
  ];

  void updateValidationList(String value) {
    passwordValidationRules[0].hasError = value.contains(RegExp(r'[A-Z]')) ? false : true;
    passwordValidationRules[1].hasError = value.contains(RegExp(r'[a-z]')) ? false : true;
    passwordValidationRules[2].hasError = value.contains(RegExp(r'[0-9]')) ? false : true;
    passwordValidationRules[3].hasError = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ? false : true;
    passwordValidationRules[4].hasError = value.length >= 6 ? false : true;

    update();
  }

  bool hasPasswordFocus = false;
  void changePasswordFocus(bool hasFocus) {
    hasPasswordFocus = hasFocus;
    update();
  }
}

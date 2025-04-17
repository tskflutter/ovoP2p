import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/model/auth/sign_up_model/sign_up_model.dart';
import 'package:ovolutter/data/model/general_setting/general_setting_response_model.dart';
import 'package:ovolutter/data/model/model/error_model.dart';
import 'package:ovolutter/data/repo/auth/account_creation_repo.dart';

class AccountCreationController extends GetxController {
  AccountCreationRepo accountCreationRepo;

  AccountCreationController({
    required this.accountCreationRepo,
  });

  bool isLoading = true;
  int step = 0;

  bool agreeTC = false;

  GeneralSettingResponseModel generalSettingMainModel = GeneralSettingResponseModel();

  bool checkPasswordStrength = false;
  bool needAgree = true;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode countryNameFocusNode = FocusNode();
  final FocusNode mobileFocusNode = FocusNode();
  final FocusNode userNameFocusNode = FocusNode();
  final FocusNode companyNameFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();

  String? email;
  String? password;
  String? confirmPassword;
  String? countryName;
  String? countryCode;
  String? mobileCode;
  String? userName;
  String? phoneNo;
  String? firstName;
  String? lastName;

  RegExp regex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  bool submitLoading = false;

  // SignUpModel getUserData() {
  //   SignUpModel model = SignUpModel(
  //     firstName: fNameController.text.toString(),
  //     lastName: lNameController.text.toString(),
  //     email: emailController.text.toString(),
  //     password: passwordController.text.toString(),
  //     agree: agreeTC ? true : false,
  //   );

  //   return model;
  // }

  updateAgreeTC() {
    agreeTC = !agreeTC;
    update();
  }

  void closeAllController() {
    isLoading = false;
    emailController.text = '';
    passwordController.text = '';
    cPasswordController.text = '';
    fNameController.text = '';
    lNameController.text = '';
  }

  clearAllData() {
    closeAllController();
  }

  void changeStep() {
    // if (step == 0) {
    //   if (warehouseId != "") {
    //     step++;
    //   } else {
    //     CustomSnackBar.error(errorList: [MyStrings.selcetWarehouse.tr]);
    //   }
    // } else if (step == 1) {
    //   if (selectedProduct.isNotEmpty) {
    //     step++;
    //   } else {
    //     CustomSnackBar.error(errorList: [MyStrings.selectProducts.tr]);
    //   }
    // }
    step++;
    update();
  }

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
}

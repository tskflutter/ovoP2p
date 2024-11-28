import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:ovolutter/data/model/user/user.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/route/route.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/data/model/auth/login/login_response_model.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/repo/auth/login_repo.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app/packages/signin_with_linkdin/signin_with_linkedin.dart';
import '../../model/general_setting/general_setting_response_model.dart';

class LoginController extends GetxController {
  LoginRepo loginRepo;
  LoginController({required this.loginRepo});

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email;
  String? password;

  List<String> errors = [];
  bool remember = false;

  void forgetPassword() {
    Get.toNamed(RouteHelper.forgotPasswordScreen);
  }

  void checkAndGotoNextStep(LoginResponseModel responseModel) async {
    bool needEmailVerification = responseModel.data?.user?.ev == "1" ? false : true;
    bool needSmsVerification = responseModel.data?.user?.sv == '1' ? false : true;
    bool isTwoFactorEnable = responseModel.data?.user?.tv == '1' ? false : true;

    if (remember) {
      await SharedPreferenceService.setBool(SharedPreferenceService.rememberMeKey, true);
    } else {
      await SharedPreferenceService.setBool(SharedPreferenceService.rememberMeKey, false);
    }

    await SharedPreferenceService.setString(SharedPreferenceService.userIdKey, responseModel.data?.user?.id.toString() ?? '-1');
    await SharedPreferenceService.setString(SharedPreferenceService.accessTokenKey, responseModel.data?.accessToken ?? '');
    await SharedPreferenceService.setString(SharedPreferenceService.accessTokenType, responseModel.data?.tokenType ?? '');
    await SharedPreferenceService.setString(SharedPreferenceService.userEmailKey, responseModel.data?.user?.email ?? '');
    await SharedPreferenceService.setString(SharedPreferenceService.userPhoneNumberKey, responseModel.data?.user?.mobile ?? '');
    await SharedPreferenceService.setString(SharedPreferenceService.userNameKey, responseModel.data?.user?.username ?? '');

    await loginRepo.sendUserToken();
    bool isProfileCompleteEnable = responseModel.data?.user?.profileComplete == '0' ? true : false;

    if (isProfileCompleteEnable) {
      Get.offAndToNamed(RouteHelper.profileCompleteScreen);
    } else if (needEmailVerification) {
      Get.offAndToNamed(RouteHelper.emailVerificationScreen);
    } else if (needSmsVerification) {
      Get.offAndToNamed(RouteHelper.smsVerificationScreen);
    } else if (isTwoFactorEnable) {
      Get.offAndToNamed(
        RouteHelper.twoFactorScreen,
      );
    } else {
      Get.offAndToNamed(RouteHelper.bottomNavBar);
    }
  }

  bool isSubmitLoading = false;
  void loginUser() async {
    try {
      isSubmitLoading = true;
      update();

      // Call the login API
      ResponseModel model = await loginRepo.loginUser(
        emailController.text.toString(),
        passwordController.text.toString(),
      );

      // Check if the response status code is 200 (success)
      if (model.statusCode == 200) {
        // Parse the response into the LoginResponseModel
        LoginResponseModel loginModel = LoginResponseModel.fromJson(model.responseJson);

        // Check if the login status is successful
        if (loginModel.status.toString().toLowerCase() == MyStrings.success.toLowerCase()) {
          // Extract access token, token type, and user details
          String accessToken = loginModel.data?.accessToken ?? "";
          String tokenType = loginModel.data?.tokenType ?? "";
          User? user = loginModel.data?.user;

          // Handle the next steps based on user status
          await RouteHelper.checkUserStatusAndGoToNextStep(
            user,
            accessToken: accessToken,
            tokenType: tokenType,
            isRemember: remember,
          );

          // If the user chose to "remember me", save the state
          if (remember) {
            changeRememberMe();
          }
        } else {
          // Show an error if login failed
          CustomSnackBar.error(
            errorList: loginModel.message ?? [MyStrings.loginFailedTryAgain],
          );
        }
      } else {
        // Show an error if the status code is not 200
        CustomSnackBar.error(errorList: [model.message]);
      }
    } catch (e, stackTrace) {
      // Handle any unexpected errors that might occur
      debugPrint('Error during login: $e');
      debugPrint('Stacktrace: $stackTrace');

      // Show a generic error message
      CustomSnackBar.error(errorList: [MyStrings.somethingWentWrong]);
    } finally {
      // Reset the loading state
      isSubmitLoading = false;
      update();
    }
  }

  changeRememberMe() {
    remember = !remember;
    update();
  }

  void clearTextField() {
    passwordController.text = '';
    emailController.text = '';

    if (remember) {
      remember = false;
    }
    update();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isGoogleSignInLoading = false;
  Future<void> signInWithGoogle() async {
    try {
      isGoogleSignInLoading = true;
      update();
      googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        isGoogleSignInLoading = false;
        update();
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      print(googleAuth.accessToken);
      await socialLoginUser(provider: 'google', accessToken: googleAuth.accessToken ?? '');
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBar.error(errorList: [e.toString()]);
    }

    isGoogleSignInLoading = false;
    update();
  }

  //SIGN IN With LinkeDin
  bool isLinkedinLoading = false;
  Future<void> signInWithLinkedin(BuildContext context) async {
    try {
      isLinkedinLoading = false;
      update();
      //TODO
      // SocialiteCredentials linkedinCredential = loginRepo.apiClient.getSocialCredentialsConfigData();
      // String linkedinCredentialRedirectUrl = "${loginRepo.apiClient.getSocialCredentialsRedirectUrl()}/linkedin";
      // print(linkedinCredentialRedirectUrl);
      // print(linkedinCredential.linkedin?.toJson());
      // SignInWithLinkedIn.signIn(
      //   context,
      //   config: LinkedInConfig(clientId: linkedinCredential.linkedin?.clientId ?? '', clientSecret: linkedinCredential.linkedin?.clientSecret ?? '', scope: ['openid', 'profile', 'email'], redirectUrl: "$linkedinCredentialRedirectUrl"),
      //   onGetAuthToken: (data) {
      //     print('Auth token data: ${data.toJson()}');
      //   },
      //   onGetUserProfile: (token, user) async {
      //     print('${token.idToken}-');
      //     print('LinkedIn User: ${user.toJson()}');

      //     await socialLoginUser(provider: 'linkedin', accessToken: token.accessToken ?? '');
      //   },
      //   onSignInError: (error) {
      //     print('Error on sign in: $error');
      //     CustomSnackBar.error(errorList: [error.description!] ?? [MyStrings.loginFailedTryAgain.tr]);
      //     isLinkedinLoading = false;
      //     update();
      //   },
      // );
    } catch (e) {
      debugPrint(e.toString());

      CustomSnackBar.error(errorList: [e.toString()]);
    }
  }

  Future socialLoginUser({
    String accessToken = '',
    String? provider,
  }) async {
    try {
      ResponseModel responseModel = await loginRepo.socialLoginUser(
        accessToken: accessToken,
        provider: provider,
      );
      if (responseModel.statusCode == 200) {
        LoginResponseModel loginModel = LoginResponseModel.fromJson(responseModel.responseJson);
        if (loginModel.status.toString().toLowerCase() == MyStrings.success.toLowerCase()) {
          remember = true;
          update();
          checkAndGotoNextStep(loginModel);
        } else {
          CustomSnackBar.error(errorList: loginModel.message ?? [MyStrings.loginFailedTryAgain.tr]);
        }
      } else {
        CustomSnackBar.error(errorList: [responseModel.message]);
      }
    } catch (e) {
      //printx(e.toString());
    }
  }

  bool checkSocialAuthActiveOrNot({String provider = 'all'}) {
  //TODO
    //   if (provider == 'google') {
    //     return loginRepo.apiClient.getSocialCredentialsConfigData().google?.status == '1';
    //   } else if (provider == 'facebook') {
    //     return loginRepo.apiClient.getSocialCredentialsConfigData().facebook?.status == '1';
    //   } else if (provider == 'linkedin') {
    //     return loginRepo.apiClient.getSocialCredentialsConfigData().linkedin?.status == '1';
    //   } else {
    //     return loginRepo.apiClient.isSocialAnyOfSocialLoginOptionEnable();
    //   }
    // }
    return true;
  }
}

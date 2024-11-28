import 'package:ovolutter/app/components/bottom-nav-bar/bottom_nav_1.dart';
import 'package:ovolutter/app/screens/profile/profile_screen.dart';
import 'package:ovolutter/data/model/user/user.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/app/components/preview_image.dart';
import 'package:ovolutter/app/screens/account/change-password/change_password_screen.dart';
import 'package:ovolutter/app/screens/auth/email_verification_page/email_verification_screen.dart';
import 'package:ovolutter/app/screens/auth/forget_password/forget_password/forget_password.dart';
import 'package:ovolutter/app/screens/auth/forget_password/reset_password/reset_password_screen.dart';
import 'package:ovolutter/app/screens/auth/forget_password/verify_forget_password/verify_forget_password_screen.dart';
import 'package:ovolutter/app/screens/auth/kyc/kyc.dart';
import 'package:ovolutter/app/screens/auth/login/login_screen.dart';
import 'package:ovolutter/app/screens/auth/profile_complete/profile_complete_screen.dart';
import 'package:ovolutter/app/screens/auth/registration/registration_screen.dart';
import 'package:ovolutter/app/screens/auth/sms_verification_page/sms_verification_screen.dart';
import 'package:ovolutter/app/screens/components_preview/components_preview_screen.dart';
import 'package:ovolutter/app/screens/edit_profile/edit_profile_screen.dart';
import 'package:ovolutter/app/screens/faq/faq_screen.dart';
import 'package:ovolutter/app/screens/language/language_screen.dart';
import 'package:ovolutter/app/screens/notification/notification_screen.dart';
import 'package:ovolutter/app/screens/onboard/onboar_screen.dart';
import 'package:ovolutter/app/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:ovolutter/app/screens/splash/splash_screen.dart';
import 'package:ovolutter/app/screens/ticket/new_ticket_screen/new_ticket_screen.dart';
import 'package:ovolutter/app/screens/ticket/all_ticket_screen/all_ticket_screen.dart';
import 'package:ovolutter/app/screens/transaction/transactions_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/screens/auth/two_factor/two_factor_setup_screen/two_factor_setup_screen.dart';
import '../../app/screens/auth/two_factor/two_factor_verification_screen/two_factor_verification_screen.dart';
import '../../app/screens/deposits/deposit_webview/my_webview_screen.dart';
import '../../app/screens/deposits/deposits_history_screen.dart';
import '../../app/screens/deposits/new_deposit/new_deposit_screen.dart';
import '../../app/screens/ticket/ticket_details_screen/ticket_details_screen.dart';
import '../../app/screens/withdraw/add_withdraw_screen/add_withdraw_method_screen.dart';
import '../../app/screens/withdraw/confirm_withdraw_screen/withdraw_confirm_screen.dart';
import '../../app/screens/withdraw/withdraw_history/withdraw_screen.dart';

class RouteHelper {
  //use screen in screen name and route name
  static const String componentPreviewScreen = "/component_preview_screen";
  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = "/onboard_screen";
  static const String loginScreen = "/login_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String changePasswordScreen = "/change_password_screen";
  static const String registrationScreen = "/registration_screen";
  static const String bottomNavBar = "/bottom_nav_bar";
  static const String myWalletScreen = "/my_wallet_screen";
  static const String addMoneyHistoryScreen = "/add_money_history_screen";
  static const String profileCompleteScreen = "/profile_complete_screen";
  static const String emailVerificationScreen = "/verify_email_screen";
  static const String smsVerificationScreen = "/verify_sms_screen";
  static const String verifyPassCodeScreen = "/verify_pass_code_screen";
  static const String twoFactorScreen = "/two-factor-screen";
  static const String resetPasswordScreen = "/reset_pass_screen";
  static const String transactionHistoryScreen = "/transaction_history_screen";
  static const String notificationScreen = "/notification_screen";
  static const String profileScreen = "/profile_screen";
  static const String editProfileScreen = "/edit_profile_screen";
  static const String kycScreen = "/kyc_screen";
  static const String privacyScreen = "/privacy-screen";

  static const String withdrawScreen = "/withdraw-screen";
  static const String addWithdrawMethodScreen = "/withdraw-method";
  static const String withdrawConfirmScreenScreen = "/withdraw-preview-screen";
  static const String supportTicketMethodsList = '/all_ticket_methods';
  static const String allTicketScreen = '/all_ticket_screen';

  static const String ticketDetailsScreen = '/ticket_details_screen';

  static const String newTicketScreen = '/new_ticket_screen';

  static const String depositsHistoryScreen = "/deposits";
  static const String newDepositScreenScreen = "/deposits_money";
  static const String depositWebViewScreen = '/deposit_webView';
  static const String languageScreen = "/languages_screen";
  static const String twoFactorSetupScreen = "/two-factor-setup-screen";
  static const String previewImageScreen = "/preview-image-screen";
  static const String faqScreen = "/faq-screen";
  static const String notification = "/notifications-screen";

  List<GetPage> routes = [
    GetPage(name: componentPreviewScreen, page: () => const ComponentPreviewScreen()),
    GetPage(name: onboardScreen, page: () => const OnboardScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: forgotPasswordScreen, page: () => const ForgetPasswordScreen()),
    GetPage(name: changePasswordScreen, page: () => const ChangePasswordScreen()),
    GetPage(name: registrationScreen, page: () => const RegistrationScreen()),
    GetPage(name: profileCompleteScreen, page: () => const ProfileCompleteScreen()),
    GetPage(name: bottomNavBar, page: () => const BottomNavBar()),
    GetPage(name: withdrawScreen, page: () => const WithdrawScreen()),
    GetPage(name: addWithdrawMethodScreen, page: () => const AddWithdrawMethod()),
    GetPage(name: withdrawConfirmScreenScreen, page: () => const WithdrawConfirmScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen()),
    GetPage(name: transactionHistoryScreen, page: () => const TransactionsScreen()),
    GetPage(name: kycScreen, page: () => const KycScreen()),
    GetPage(name: depositWebViewScreen, page: () => MyWebViewScreen(redirectUrl: Get.arguments)),
    GetPage(name: depositsHistoryScreen, page: () => const DepositsHistoryScreen()),
    GetPage(name: newDepositScreenScreen, page: () => const NewDepositScreen()),
    GetPage(name: emailVerificationScreen, page: () => const EmailVerificationScreen()),
    GetPage(name: smsVerificationScreen, page: () => const SmsVerificationScreen()),
    GetPage(name: verifyPassCodeScreen, page: () => const VerifyForgetPassScreen()),
    GetPage(name: resetPasswordScreen, page: () => const ResetPasswordScreen()),
    GetPage(name: twoFactorScreen, page: () => const TwoFactorVerificationScreen()),
    GetPage(
      name: kycScreen,
      page: () => const KycScreen(),
      transition: Transition.fadeIn,
      fullscreenDialog: true,
      popGesture: false,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: privacyScreen, page: () => const PrivacyPolicyScreen()),
    GetPage(name: twoFactorSetupScreen, page: () => const TwoFactorSetupScreen()),
    GetPage(name: languageScreen, page: () => const LanguageScreen()),
    // GetPage(name: communityGroupList, page: () => const OurCommunityGroupList()),
    GetPage(name: allTicketScreen, page: () => const AllTicketScreen()),
    GetPage(name: ticketDetailsScreen, page: () => const TicketDetailsScreen()),
    GetPage(name: newTicketScreen, page: () => const NewTicketScreen()),
    GetPage(name: previewImageScreen, page: () => PreviewImage(url: Get.arguments)),
    GetPage(name: faqScreen, page: () => const FaqScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationScreen()),
  ];

  static Future<void> checkUserStatusAndGoToNextStep(User? user, {bool isRemember = false, String accessToken = "", String tokenType = ""}) async {
    bool needEmailVerification = user?.ev == "1" ? false : true;
    bool needSmsVerification = user?.sv == '1' ? false : true;
    bool isTwoFactorEnable = user?.tv == '1' ? false : true;

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (isRemember) {
      await sharedPreferences.setBool(SharedPreferenceService.rememberMeKey, true);
    } else {
      await sharedPreferences.setBool(SharedPreferenceService.rememberMeKey, false);
    }

    await sharedPreferences.setString(SharedPreferenceService.userIdKey, user?.id.toString() ?? '-1');
    await sharedPreferences.setString(SharedPreferenceService.userEmailKey, user?.email ?? '');
    await sharedPreferences.setString(SharedPreferenceService.userPhoneNumberKey, user?.mobile ?? '');
    await sharedPreferences.setString(SharedPreferenceService.userNameKey, user?.username ?? '');

    if (accessToken.isNotEmpty) {
      await sharedPreferences.setString(SharedPreferenceService.accessTokenKey, accessToken);
      await sharedPreferences.setString(SharedPreferenceService.accessTokenType, tokenType);
    }

    bool isProfileCompleteEnable = user?.profileComplete == '0' ? true : false;

    if (isProfileCompleteEnable) {
      Get.offAndToNamed(RouteHelper.profileCompleteScreen);
    } else if (needEmailVerification) {
      Get.offAndToNamed(RouteHelper.emailVerificationScreen);
    } else if (needSmsVerification) {
      Get.offAndToNamed(RouteHelper.smsVerificationScreen);
    } else if (isTwoFactorEnable) {
      Get.offAndToNamed(RouteHelper.twoFactorScreen);
    } else {
      Get.offAndToNamed(RouteHelper.bottomNavBar, arguments: [true]);
    }
  }
}

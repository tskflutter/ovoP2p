import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ovolutter/core/utils/method.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/url_container.dart';
import 'package:ovolutter/data/model/auth/verification/email_verification_model.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';

class LoginRepo {
  Future<ResponseModel> loginUser(String email, String password) async {
    Map<String, String> map = {'username': email, 'password': password};
    String url = '${UrlContainer.baseUrl}${UrlContainer.loginEndPoint}';
    final response = await ApiService.postRequest(url, map);
    return response;
  }

  Future<ResponseModel> socialLoginUser({
    String accessToken = '',
    String? provider,
  }) async {
    Map<String, String>? map;

    if (provider == 'google') {
      map = {'token': accessToken, 'provider': "google"};
    }

    if (provider == 'linkedin') {
      map = {'token': accessToken, 'provider': "linkedin"};
    }

    if (provider == 'facebook') {
      map = {'token': accessToken, 'provider': "facebook"};
    }

    String url = '${UrlContainer.baseUrl}${UrlContainer.socialLoginEndPoint}';
    ResponseModel model = await ApiService.postRequest(url, map);
    return model;
  }

  Future<String> forgetPassword(String type, String value) async {
    final map = modelToMap(value, type);
    String url = '${UrlContainer.baseUrl}${UrlContainer.forgetPasswordEndPoint}';
    final response = await ApiService.postRequest(url, map);

    EmailVerificationModel model = EmailVerificationModel.fromJson(response.responseJson);

    if (model.status.toLowerCase() == "success") {
      SharedPreferenceService.setUserEmail(model.data?.email ?? '');
      CustomSnackBar.success(successList: ['${MyStrings.passwordResetEmailSentTo} ${model.data?.email ?? MyStrings.yourEmail}']);
      return model.data?.email ?? '';
    } else {
      CustomSnackBar.error(errorList: model.message ?? [MyStrings.requestFail]);
      return '';
    }
  }

  Map<String, String> modelToMap(String value, String type) {
    Map<String, String> map = {'type': type, 'value': value};
    return map;
  }

  Future<EmailVerificationModel> verifyForgetPassCode(String code) async {
    String? email = SharedPreferenceService.getString(SharedPreferenceService.userEmailKey, defaultValue: '');
    Map<String, String> map = {'code': code, 'email': email};

    String url = '${UrlContainer.baseUrl}${UrlContainer.passwordVerifyEndPoint}';

    final response = await ApiService.postRequest(url, map);

    EmailVerificationModel model = EmailVerificationModel.fromJson(response.responseJson);
    if (model.status == 'success') {
      model.setCode(200);
      return model;
    } else {
      model.setCode(400);
      return model;
    }
  }

  Future<ResponseModel> resetPassword(String email, String password, String code) async {
    Map<String, String> map = {
      'token': code,
      'email': email,
      'password': password,
      'password_confirmation': password,
    };

    String url = '${UrlContainer.baseUrl}${UrlContainer.resetPasswordEndPoint}';

    ResponseModel responseModel = await ApiService.postRequest(url, map);

    return responseModel;

    //final response = await http.post(url, body: map, headers: {"Accept": "application/json",});
  }

  Future<bool> sendUserToken() async {
    String deviceToken;
    if (SharedPreferenceService.containsKey(SharedPreferenceService.fcmDeviceKey)) {
      deviceToken = SharedPreferenceService.getString(SharedPreferenceService.fcmDeviceKey) ?? '';
    } else {
      deviceToken = '';
    }

    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    bool success = false;

    if (deviceToken.isEmpty) {
      firebaseMessaging.getToken().then((fcmDeviceToken) async {
        success = await sendUpdatedToken(fcmDeviceToken ?? '');
      });
    } else {
      firebaseMessaging.onTokenRefresh.listen((fcmDeviceToken) async {
        if (deviceToken == fcmDeviceToken) {
          success = true;
        } else {
          SharedPreferenceService.setString(SharedPreferenceService.fcmDeviceKey, fcmDeviceToken);
          success = await sendUpdatedToken(fcmDeviceToken);
        }
      });
    }
    return success;
  }

  Future<bool> sendUpdatedToken(String deviceToken) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.deviceTokenEndPoint}';
    Map<String, String> map = deviceTokenMap(deviceToken);
    await ApiService.postRequest(url, map);
    return true;
  }

  Map<String, String> deviceTokenMap(String deviceToken) {
    Map<String, String> map = {'token': deviceToken.toString()};
    return map;
  }
}

import 'package:ovolutter/core/utils/method.dart';
import 'package:ovolutter/core/utils/url_container.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/services/api_service.dart';

class ChangePasswordRepo {
  String token = '', tokenType = '';

  Future<ResponseModel> changePassword(String currentPass, String password) async {
    final params = modelToMap(currentPass, password);
    String url = '${UrlContainer.baseUrl}${UrlContainer.changePasswordEndPoint}';

    ResponseModel responseModel = await ApiService.postRequest(url,params);
    return responseModel;
  }

  modelToMap(String currentPassword, String newPass) {
    Map<String, dynamic> map2 = {'current_password': currentPassword, 'password': newPass, 'password_confirmation': newPass};
    return map2;
  }
}

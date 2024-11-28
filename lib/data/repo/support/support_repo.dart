import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ovolutter/core/utils/method.dart';
import 'package:ovolutter/core/utils/my_strings.dart';
import 'package:ovolutter/core/utils/url_container.dart';
import 'package:ovolutter/data/model/authorization/authorization_response_model.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/model/support/new_ticket_store_model.dart';
import 'package:ovolutter/data/services/api_service.dart';
import 'package:ovolutter/data/services/shared_pref_service.dart';
import 'package:ovolutter/app/components/snack_bar/show_custom_snackbar.dart';

class SupportRepo {
  Future<ResponseModel> getCommunityGroupListList() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.communityGroupsEndPoint}";
    final response = await ApiService.getRequest(
      url,
    );
    return response;
  }

  Future<ResponseModel> getSupportMethodsList() async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.supportMethodsEndPoint}";
    final response = await ApiService.getRequest(url);
    return response;
  }

  Future<ResponseModel> getSupportTicketList(String page) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.supportListEndPoint}?page=$page";
    final response = await ApiService.getRequest(url);
    return response;
  }

  Future<dynamic> storeTicket(TicketStoreModel model) async {
    String url = "${UrlContainer.baseUrl}${UrlContainer.storeSupportEndPoint}";
    Map<String, String> params = {'subject': model.subject, 'message': model.message, 'priority': model.priority};

    Map<String, File> attachmentFiles = model.list!.asMap().map((index, value) => MapEntry("attachments[]", value));

    final response = await ApiService.postMultiPartRequest(url, params, attachmentFiles);

    return response;
  }

  Future<dynamic> getSingleTicket(String ticketId) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.supportViewEndPoint}/$ticketId';
    ResponseModel response = await ApiService.getRequest(url);
    return response;
  }

  Future<dynamic> replyTicket(
    String message,
    List<File> fileList,
    String ticketId,
  ) async {
    try {
      String url = "${UrlContainer.baseUrl}${UrlContainer.supportReplyEndPoint}/$ticketId";
      Map<String, String> map = {
        'message': message.toString(),
      };

      Map<String, File> attachmentFiles = fileList.asMap().map((index, value) => MapEntry("attachments[]", value));

      final response = await ApiService.postMultiPartRequest(url, map, attachmentFiles);

      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(response.responseJson);

      if (model.status?.toLowerCase() == MyStrings.success.toLowerCase()) {
        return true;
      } else {
        CustomSnackBar.error(errorList: model.message ?? [MyStrings.error]);
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> closeTicket(String ticketId) async {
    String url = '${UrlContainer.baseUrl}${UrlContainer.supportCloseEndPoint}/$ticketId';
    ResponseModel response = await ApiService.postRequest(url, {});
    return response;
  }
}

class ReplyTicketModel {
  final String? message;
  final List<File>? fileList;

  ReplyTicketModel(this.message, this.fileList);
}

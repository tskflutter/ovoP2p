import 'package:ovolutter/core/utils/method.dart';
import 'package:ovolutter/core/utils/url_container.dart';
import 'package:ovolutter/data/model/global/response_model/response_model.dart';
import 'package:ovolutter/data/services/api_service.dart';

class TransactionRepo{


  Future<ResponseModel> getTransactionList(int page, {String type = "", String remark = "", String searchText = "",String walletType = ''}) async{

    if(type.toLowerCase() == "all" || (type.toLowerCase()!='plus'&&type.toLowerCase()!='minus')){
      type='';
    }

    if(remark.isEmpty || remark.toLowerCase() == "all"){
      remark = '';
    }

    String url = '${UrlContainer.baseUrl}${UrlContainer.transactionEndpoint}?page=$page&type=$type&remark=$remark&search=$searchText';
    ResponseModel responseModel = await ApiService.getRequest(url,);
    return responseModel;

  }
}
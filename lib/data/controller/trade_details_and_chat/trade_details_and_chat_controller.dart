import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/data/model/general_setting/general_setting_response_model.dart';
import 'package:ovolutter/data/repo/trade_details/trade_details_repo.dart';

class TradeDetailsAndChatController extends GetxController {
  TradeDetailsRepo tradeDetailsRepo;
  TradeDetailsAndChatController({required this.tradeDetailsRepo});
  late TabController tabController;
  bool isLoading = false;
  List<Map<String, String>> steplist = [
    {"sender": "1", "timestamp": "5 min ago", "message": "Hi, I’ve just initiated a trade for 0.5 ETH. I’ll send the payment shortly. Could you confirm your payment details?"},
    {
      "sender": "2",
      "timestamp": "5 min ago",
      "message": """Hello, thanks for your interest! Please send \$800 USD to this account:
Bank Name: GlobalBank
Account Number: 123-456-789
Account Holder: CryptoProSeller
Let me know once you’ve sent it."""
    },
    {"sender": "1", "timestamp": "5 min ago", "message": "Hey Bob! How’s it going?"},
    {"sender": "2", "timestamp": "5 min ago", "message": "Hi Alice! I’m good, thanks. You?"},
    {"sender": "1", "timestamp": "5 min ago", "message": "Doing great! Just working on the new Flutter project."},
    {"sender": "2", "timestamp": "5 min ago", "message": "Nice! Need any help with it?"},
    {"sender": "1", "timestamp": "5 min ago", "message": "Maybe later 😄 I'll let you know!"}
  ];

  int currentIndex = 0;
  int selectedCurrencyIndex = 0;
  PageController? controller = PageController();
  bool saveforNext = false;
  changeSaveStatus() {
    saveforNext = !saveforNext;
    update();
  }

  bool verifiedMerchant = false;
  changeMerchantStatus() {
    verifiedMerchant = !verifiedMerchant;
    update();
  }

  bool adswithNoVerification = false;
  changeAdsStatus() {
    adswithNoVerification = !adswithNoVerification;
    update();
  }

  String defaultCurrencySymbol = "";
  GeneralSettingResponseModel generalSettingResponseModel = GeneralSettingResponseModel();

  changeIndicator() {
    if (tabController.index == 2) {
      var index = tabController.previousIndex;
      tabController.index = index;
    }

    currentIndex = tabController.index;
    update();
  }

  changeCurrencyIndex(int index) {
    selectedCurrencyIndex = index;
    update();
  }

  int currentStep = 0;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/data/model/general_setting/general_setting_response_model.dart';
import 'package:ovolutter/data/repo/home/home_repo.dart';
import 'package:ovolutter/data/repo/market/market_repo.dart';
import 'package:ovolutter/data/repo/trade/trade_repo.dart';

class TradeController extends GetxController {
  TradeRepo tradeRepo;
  TradeController({required this.tradeRepo});
  late TabController tabController;
  bool isLoading = false;
  List items = [
    "Bank Transfer",
    "PayPal",
    "Stripe",
    "Bkash",
    "Coinbase",
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
}

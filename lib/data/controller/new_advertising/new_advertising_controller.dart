import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ovolutter/core/utils/util_exporter.dart';
import 'package:ovolutter/data/repo/new_advertising/new_advertising_repo.dart';

class NewAdvertisingController extends GetxController {
  NewAdvertisingRepo newAdvertisingRepo;

  NewAdvertisingController({required this.newAdvertisingRepo});
  late TabController tabController;

  bool active = true;

  int currentIndex = -1;
  int currentStep = 0;

  int currentTab = 0;

  List<String> buySellList = [MyStrings.buy, MyStrings.sell];
  List statusList = [MyStrings.active, MyStrings.inActive];
  List data = [
    "Bank Transfer",
    "PayPal",
    "Stripe",
  ];

  changeTab() {
    if (tabController.index == 2) {
      var index = tabController.previousIndex;
      tabController.index = index;
    }

    currentTab = tabController.index;
    update();
  }

  changeVisiblityStatus(
    int index,
  ) {
    if (currentIndex == index) {
      active = !active;
    } else {
      currentIndex = index;
      active = true;
    }
    update();
  }
}

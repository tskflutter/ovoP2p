import 'package:get/get.dart';
import 'package:ovolutter/data/repo/my_withdrawals/my_withdrawals_repo.dart';

class MyWithdrawalsController extends GetxController {
  MyWithdrawalsRepo myWithdrawalsRepo;

  MyWithdrawalsController({required this.myWithdrawalsRepo});

  int currentIndex = -1;

  changeVisiblityStatus(int index) {
    currentIndex = index;
    update();
  }
}

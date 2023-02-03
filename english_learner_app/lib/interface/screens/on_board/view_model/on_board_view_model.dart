import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardViewModel extends GetxController {
  PageController pageCtrl = PageController();
  RxInt currentPage = RxInt(0);
  void next() => SuperVisor.shared.binaryCondition(
        condition: currentPage == 2,
        inconvenient: pageCtrl.nextPage(duration: IDurations.medium.apply, curve: Curves.linear),
        convenient: IRoutes.login.go,
      );
  void previous() => pageCtrl.previousPage(duration: IDurations.medium.apply, curve: Curves.linear);
  void onPageChanged(value) => currentPage.value = value;
}

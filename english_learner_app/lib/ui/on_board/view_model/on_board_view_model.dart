import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardViewModel extends GetxController {
  PageController pageCtrl = PageController();
  RxInt currentPage = RxInt(0);
  Duration get transition => const Duration(milliseconds: 500);
  void next() => SuperVisor.shared.binaryCondition(
        condition: currentPage == 2,
        inconvenient: pageCtrl.nextPage(duration: transition, curve: Curves.linear),
        convenient: AppScreens.login.go,
      );
  void previous() => pageCtrl.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
  void onPageChanged(value) => currentPage.value = value;
}

import 'package:english_learner_app/interface/widgets/dialogs/domino_alert.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ScrollController scrollController = FixedExtentScrollController(initialItem: 1);
  RxInt pointerIndexValue = RxInt(1);

  RxDouble redClose = RxDouble(Get.width / 25);
  RxDouble yellowInfo = RxDouble(Get.width / 25);
  RxDouble greenSetting = RxDouble(Get.width / 25);

  @override
  void onClose() {
    pointerIndexValue.value = 1;
    super.onClose();
  }

  redCloseOnTap() async => SuperVisor.shared.binaryCondition(
        condition: redClose.value == Get.width / 5,
        convenient: {redClose.value = Get.width / 25},
        inconvenient: {
          redClose.value = Get.width / 5,
          await Future.delayed(IDurations.short.adjust),
          redClose.value = Get.width / 25,
        },
      );

  yellowInfoOnTap() async => SuperVisor.shared.binaryCondition(
        condition: yellowInfo.value == Get.width / 5,
        convenient: {yellowInfo.value = Get.width / 25},
        inconvenient: {
          yellowInfo.value = Get.width / 5,
          await Future.delayed(IDurations.short.adjust),
          yellowInfo.value = Get.width / 25,
        },
      );

  greenSettingOnTap() async => SuperVisor.shared.binaryCondition(
        condition: greenSetting.value == Get.width / 5,
        convenient: {greenSetting.value = Get.width / 25},
        inconvenient: {
          greenSetting.value = Get.width / 5,
          await Future.delayed(IDurations.short.adjust),
          greenSetting.value = Get.width / 25,
        },
      );

  reviewOnTap() {}

  profileImageOnTap() {}

  menuCardOnTap() {
    Get.dialog(
      DominoAlert(index: pointerIndexValue.value, onTap: () => _detechDominoAlertRoute(index: pointerIndexValue.value)),
      barrierColor: IColors.athensGray.apply,
      transitionCurve: Curves.linear,
      transitionDuration: IDurations.demi.adjust,
      useSafeArea: true,
    );
  }

  close() => IRoutes.login.go;

  _detechDominoAlertRoute({int? index}) {
    switch (index) {
      case 0:
        IRoutes.read.go;
        break;
      case 1:
        IRoutes.listen.go;
        break;
      default:
        Get.snackbar("Error", "index $index");
    }
  }
}

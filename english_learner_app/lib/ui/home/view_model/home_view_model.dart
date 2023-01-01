import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxDouble redClose = RxDouble(Get.width / 25);
  RxDouble yellowInfo = RxDouble(Get.width / 25);
  RxDouble greenSetting = RxDouble(Get.width / 25);

  redCloseOnTap() => redClose.value = redClose.value == Get.width / 5 ? Get.width / 25 : Get.width / 5;
  yellowInfoOnTap() => yellowInfo.value = yellowInfo.value == Get.width / 5 ? Get.width / 25 : Get.width / 5;
  greenSettingOnTap() => greenSetting.value = greenSetting.value == Get.width / 5 ? Get.width / 25 : Get.width / 5;

  ScrollController scrollController = FixedExtentScrollController(initialItem: 1);
  RxInt pointerIndexValue = RxInt(1);

  reviewOnTap(){}

  profileImageOnTap(){}
}

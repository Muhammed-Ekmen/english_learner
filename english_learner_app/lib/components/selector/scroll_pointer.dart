import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/utils/custom_decorations.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scrollpointer extends StatelessWidget {
  const Scrollpointer({super.key, required this.pointerIndex});
  final RxInt pointerIndex;
  @override
  Widget build(BuildContext context) => Container(
        height: Get.height / 10,
        padding: EdgeInsets.symmetric(vertical: Get.height / 23),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: Get.width / 15),
          scrollDirection: Axis.horizontal,
          itemCount: PuzzleMenuItems.values.length,
          itemBuilder: (context, index) => Obx(
            () => Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width / 100),
              width: Get.width / 15,
              decoration: IBoxDecoration.header.glassAppearance.copyWith(
                border: Border.all(width: 0),
                color: SuperVisor.shared.binaryCondition(
                  condition: index == pointerIndex.value,
                  convenient: CustomColor.rossoCorsa.get.withOpacity(0.8),
                  inconvenient: CustomColor.athensGray.get.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      );
}

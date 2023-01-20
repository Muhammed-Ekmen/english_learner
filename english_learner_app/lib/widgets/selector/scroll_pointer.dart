import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/tools/custom_decorations.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scrollpointer extends StatelessWidget {
  const Scrollpointer({super.key, required this.pointerIndex});
  final RxInt pointerIndex;
  @override
  Widget build(BuildContext context) => Container(
        height: Get.height / 10,
        padding: EdgeInsets.symmetric(vertical: Get.height / 22.5),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: PuzzleMenuItems.values.length,
          itemBuilder: (context, index) => Obx(
            () => Container(
              width: Get.width / 7,
              decoration: IBoxDecoration.header.glassAppearance.copyWith(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.zero,
                color: SuperVisor.shared.binaryCondition(condition: index == pointerIndex.value, convenient: CustomColor.deepRacingGreen.apply.withOpacity(0.7), inconvenient: CustomColor.athensGray.apply.withOpacity(0.5)),
              ),
            ),
          ),
        ),
      );
}

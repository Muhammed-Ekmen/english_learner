import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MagicButton extends StatelessWidget {
  const MagicButton({super.key, this.onTap, required this.widthModel, required this.typeKey});
  final VoidCallback? onTap;
  final RxDouble widthModel;
  final MagicButtonKeys typeKey;
  @override
  Widget build(BuildContext context) => Obx(
        () => GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: Get.width / 50),
            alignment: Alignment.center,
            duration: IDurations.low.apply,
            curve: Curves.easeInOut,
            height: Get.height / 25,
            width: widthModel.value,
            decoration: _boxDecoration,
            child: _containerChild,
          ),
        ),
      );

  BoxDecoration get _boxDecoration => BoxDecoration(color: IColors.athensGray.apply, borderRadius: BorderRadius.circular(5));
  dynamic get _containerChild => SuperVisor.shared.binaryCondition(
        condition: widthModel.value == Get.width / 25,
        convenient: Icon(Icons.circle, color: IColors.deepRacingGreen.apply, size: 8),
        inconvenient: Row(
          children: [
            Icon(typeKey.apply, color: IColors.deepRacingGreen.apply, size: 16),
            SizedBox(width: Get.width / 50),
            Text(typeKey.name.capitalize ?? ConstTexts.intance.none, style: ITextStyles.tall.apply.copyWith(color: IColors.deepRacingGreen.apply)),
          ],
        ),
      );
}

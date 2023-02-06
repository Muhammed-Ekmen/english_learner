import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DominoCard extends StatelessWidget {
  const DominoCard({super.key, required this.index, this.widht, this.height, this.iconSize});
  final int index;
  final double? widht;
  final double? height;
  final double? iconSize;
  @override
  Widget build(BuildContext context) => Container(
        width: widht ?? Get.width,
        height: height ?? Get.height / 5.5,
        margin: EdgeInsets.all(Get.width / 30),
        decoration: _iconDecoration,
        child: Icon(
          PuzzleMenuItems.values[index].apply,
          size: iconSize ?? Get.height / 10,
          color: IColors.athensGray.apply,
          shadows: [BoxShadow(color: IColors.athensGray.apply.withOpacity(0.5), offset: const Offset(5, 5), blurRadius: 12)],
        ),
      );

  BoxDecoration get _iconDecoration => BoxDecoration(color: IColors.deepRacingGreen.apply, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: IColors.deepRacingGreen.apply, offset: const Offset(5, 5), blurRadius: 24)]);
}

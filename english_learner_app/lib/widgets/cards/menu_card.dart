import 'package:english_learner_app/tools/custom_decorations.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.scrollCtrl, this.height, this.onPressed, this.onItemChanged});
  final ScrollController scrollCtrl;
  final double? height;
  final VoidCallback? onPressed;
  final void Function(int)? onItemChanged;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          height: height ?? Get.height / 3,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView.useDelegate(
              offAxisFraction: -0.1,
              squeeze: Get.width / 370,
              diameterRatio: 2,
              onSelectedItemChanged: onItemChanged,
              itemExtent: Get.width / 2,
              controller: scrollCtrl,
              childDelegate: _listWheelChildBuilderDelegate,
            ),
          ),
        ),
      );

  ListWheelChildBuilderDelegate get _listWheelChildBuilderDelegate => ListWheelChildBuilderDelegate(
        childCount: PuzzleMenuItems.values.length,
        builder: (context, index) => AnimatedContainer(
          duration: IDurations.medium.apply,
          margin: const EdgeInsets.all(15),
          decoration: IBoxDecoration.header.glassAppearance,
          child: RotatedBox(quarterTurns: 1, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [_blackIcon(index), const Icon(FontAwesomeIcons.grip, size: 15)])),
        ),
      );

  Container _blackIcon(int index) => Container(
        width: Get.width,
        height: Get.height / 4,
        margin: EdgeInsets.all(Get.width / 30),
        decoration: _iconDecoration,
        child: Icon(PuzzleMenuItems.values[index].apply, size: Get.height / 10, color: CustomColor.athensGray.apply, shadows: [BoxShadow(color: CustomColor.athensGray.apply.withOpacity(0.5), offset: const Offset(5, 5), blurRadius: 12)]),
      );

  BoxDecoration get _iconDecoration => BoxDecoration(color: CustomColor.deepRacingGreen.apply, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: CustomColor.deepRacingGreen.apply, offset: const Offset(5, 5), blurRadius: 24)]);
}

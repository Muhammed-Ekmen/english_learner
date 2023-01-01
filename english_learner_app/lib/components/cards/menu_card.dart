import 'package:english_learner_app/components/buttons/regular_button.dart';
import 'package:english_learner_app/utils/custom_decorations.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.scrollCtrl, this.height, this.buttonOnPressed, this.onItemChanged});
  final ScrollController scrollCtrl;
  final double? height;
  final VoidCallback? buttonOnPressed;
  final void Function(int)? onItemChanged;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: height ?? Get.height / 3,
        child: RotatedBox(
          quarterTurns: -1,
          child: ListWheelScrollView.useDelegate(
            offAxisFraction: -0.5,
            squeeze: Get.width / 350,
            diameterRatio: 2,
            onSelectedItemChanged: onItemChanged,
            itemExtent: Get.width / 2,
            controller: scrollCtrl,
            childDelegate: _listWheelChildBuilderDelegate,
          ),
        ),
      );

  ListWheelChildBuilderDelegate get _listWheelChildBuilderDelegate => ListWheelChildBuilderDelegate(
        childCount: PuzzleMenuItems.values.length,
        builder: (context, index) => Container(
          height: Get.height,
          width: Get.width,
          margin: const EdgeInsets.all(15),
          decoration: IBoxDecoration.header.glassAppearance,
          child: RotatedBox(quarterTurns: 1, child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_blackIcon(index), _gripAndButton(index)])),
        ),
      );

  Container _blackIcon(int index) => Container(
        width: Get.width,
        height: Get.height / 7.5,
        margin: EdgeInsets.symmetric(horizontal: Get.width / 50),
        decoration: _iconDecoration,
        child: Icon(
          PuzzleMenuItems.values[index].supplies,
          size: Get.height / 10,
          color: CustomColor.athensGray.get,
          shadows: [BoxShadow(color: CustomColor.athensGray.get.withOpacity(0.5), offset: const Offset(5, 5), blurRadius: 12)],
        ),
      );

  Column _gripAndButton(int index) => Column(
        children: [
          const Icon(FontAwesomeIcons.grip, size: 15),
          RegularButton(
            margin: const EdgeInsets.all(10),
            width: Get.width,
            height: Get.height / 20,
            onTap: buttonOnPressed,
            foregroundColor: CustomColor.athensGray.get,
            backGorundColor: CustomColor.deepRacingGreen.get,
            title: PuzzleMenuItems.values[index].name.toUpperCase(),
          ),
        ],
      );

  BoxDecoration get _iconDecoration => BoxDecoration(
        color: CustomColor.deepRacingGreen.get,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: CustomColor.deepRacingGreen.get, offset: const Offset(5, 5), blurRadius: 24)],
      );
}

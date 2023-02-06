import 'package:english_learner_app/interface/widgets/cards/domino_card.dart';
import 'package:english_learner_app/utils/tools/custom_decorations.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
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
          height: height ?? Get.height / 3.5,
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
          duration: IDurations.demi.adjust,
          margin: const EdgeInsets.all(15),
          decoration: IBoxDecoration.header.glassAppearance,
          child: RotatedBox(
            quarterTurns: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DominoCard(index: index),
                const Icon(FontAwesomeIcons.grip, size: 15),
              ],
            ),
          ),
        ),
      );
}

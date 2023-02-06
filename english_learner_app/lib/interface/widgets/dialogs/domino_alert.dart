import 'package:english_learner_app/interface/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/interface/widgets/cards/domino_card.dart';
import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DominoAlert extends StatelessWidget {
  const DominoAlert({super.key, required this.index, this.onTap});
  final int index;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DominoCard(
            index: index,
            height: Get.height,
            widht: Get.width,
            iconSize: Get.height / 4,
          ),
          Padding(
            padding: IMeasures.screenOrientation.adjust,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: RegularButton(
                    height: Get.height / 18,
                    onTap: () => Get.back(),
                    title: ConstTexts.intance.back,
                    backGorundColor: IColors.rossoCorsa.apply,
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 20,
                  child: RegularButton(
                    height: Get.height / 18,
                    righDirection: true,
                    onTap: () {},
                    title: ConstTexts.intance.go,
                    icon: FontAwesomeIcons.champagneGlasses,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

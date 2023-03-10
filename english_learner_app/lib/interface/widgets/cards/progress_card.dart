import 'package:english_learner_app/utils/tools/custom_decorations.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:english_learner_app/interface/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key, this.reviewButtonOnPressed, this.wordOfDay});
  final VoidCallback? reviewButtonOnPressed;
  final String? wordOfDay;
  @override
  Widget build(BuildContext context) => Row(children: [Expanded(flex: 18, child: _wordOfDay), const Spacer(flex: 1), Expanded(flex: 9, child: _reviewProgress)]);

  get _wordOfDay => Container(
        height: Get.height / 6,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        margin: IMeasures.cardVertical.adjust,
        decoration: IBoxDecoration.header.glassAppearance,
        child: Column(
          children: [
            FittedBox(child: Text(ConstTexts.intance.wordOfTheDay, style: ITextStyles.grande.apply.copyWith(color: IColors.deepRacingGreen.apply))),
            Text(wordOfDay ?? ConstTexts.intance.progresCardDescription, style: ITextStyles.short.apply.copyWith(color: IColors.deepRacingGreen.apply)),
          ],
        ),
      );

  get _reviewProgress => Container(
        width: Get.width,
        height: Get.height / 5,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: IBoxDecoration.header.glassAppearance,
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: FittedBox(
                child: Column(
                  children: [
                    Icon(FontAwesomeIcons.magnifyingGlass, size: Get.height / 15, color: IColors.deepRacingGreen.apply),
                    Text(ConstTexts.intance.reviewYourProgress, style: ITextStyles.grande.apply.copyWith(color: IColors.deepRacingGreen.apply, fontSize: 12)),
                  ],
                ),
              ),
            ),
            Expanded(flex: 7, child: RegularButton(title: ConstTexts.intance.review, margin: const EdgeInsets.symmetric(vertical: 5), onTap: reviewButtonOnPressed, backGorundColor: IColors.rossoCorsa.apply)),
          ],
        ),
      );
}

import 'package:english_learner_app/components/buttons/regular_button.dart';
import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/utils/custom_decorations.dart';
import 'package:english_learner_app/utils/extensions.dart';
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
        height: Get.height / 5,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        margin: ConstSizes.cardVertical.measure,
        decoration: IBoxDecoration.header.glassAppearance,
        child: Column(
          children: [
            FittedBox(child: Text(ConstTexts.intance.wordOfTheDay, style: ConstTextStyles.title.setUp.copyWith(color: CustomColor.deepRacingGreen.get))),
            Text(wordOfDay ?? ConstTexts.intance.progresCardDescription, style: ConstTextStyles.description.setUp.copyWith(color: CustomColor.deepRacingGreen.get)),
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
                    Icon(FontAwesomeIcons.magnifyingGlass, size: Get.height / 15, color: CustomColor.deepRacingGreen.get),
                    Text(ConstTexts.intance.reviewYourProgress, style: ConstTextStyles.title.setUp.copyWith(color: CustomColor.deepRacingGreen.get, fontSize: 12)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: RegularButton(
                title: ConstTexts.intance.review,
                margin: const EdgeInsets.symmetric(vertical: 5),
                onTap: reviewButtonOnPressed,
                backGorundColor: CustomColor.rossoCorsa.get,
              ),
            ),
          ],
        ),
      );
}

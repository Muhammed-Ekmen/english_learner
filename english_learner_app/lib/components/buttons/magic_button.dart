import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/utils/extensions.dart';
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
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: Get.height / 25,
            width: widthModel.value,
            decoration: BoxDecoration(color: CustomColor.athensGray.get, borderRadius: BorderRadius.circular(5)),
            child: FittedBox(
              child: widthModel.value == Get.width / 25
                  ? Icon(Icons.circle, color: CustomColor.deepRacingGreen.get, size: 8)
                  : Row(
                      children: [
                        Icon(typeKey.call, color: CustomColor.deepRacingGreen.get, size: 16),
                        SizedBox(width: Get.width / 50),
                        Text(typeKey.name.capitalize ?? ConstTexts.intance.none, style: ConstTextStyles.content.setUp.copyWith(color: CustomColor.deepRacingGreen.get)),
                      ],
                    ),
            ),
          ),
        ),
      );
}

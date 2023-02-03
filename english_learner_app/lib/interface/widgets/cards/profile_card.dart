import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, this.profileImage, this.emailOrUsername, this.imageOntap});
  final String? profileImage;
  final String? emailOrUsername;
  final VoidCallback? imageOntap;

  @override
  Widget build(BuildContext context) => Container(
        width: Get.width,
        height: Get.height / 10,
        margin: IMeasures.cardVertical.adjust,
        child: Row(children: [Expanded(flex: 2, child: _profileImage), const Spacer(flex: 1), Expanded(flex: 6, child: _profileInfo)]),
      );

  get _profileImage => GestureDetector(
        onTap: imageOntap,
        child: Container(
          width: Get.width / 4,
          height: Get.width / 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 5, color: IColors.athensGray.apply),
            boxShadow: [BoxShadow(color: IColors.athensGray.apply, offset: const Offset(1, 1), blurRadius: 12)],
            image: DecorationImage(image: profileImage ?? CallImages.defaultProfile.provider, fit: BoxFit.cover),
          ),
        ),
      );

  get _profileInfo => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(ConstTexts.intance.goodDay.toUpperCase(), style: ITextStyles.tall.apply),
              Icon(FontAwesomeIcons.handHoldingHeart, color: IColors.athensGray.apply, size: 16),
            ],
          ),
          Text(emailOrUsername ?? ConstTexts.intance.none, style: ITextStyles.tall.apply.copyWith(fontSize: 20)),
        ],
      );
}

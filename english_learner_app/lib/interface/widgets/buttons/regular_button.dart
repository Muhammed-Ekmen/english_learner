import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegularButton extends StatelessWidget {
  const RegularButton({super.key, this.width, this.height, required this.onTap, this.title, this.backGorundColor, this.margin, this.icon, this.righDirection, this.foregroundColor});
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final String? title;
  final Color? backGorundColor;
  final IconData? icon;
  final EdgeInsetsGeometry? margin;
  final bool? righDirection;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) => Container(
        height: height ?? Get.height / 15,
        width: width ?? Get.width,
        margin: margin,
        child: Directionality(
          textDirection: SuperVisor.shared.nullable(willCheck: righDirection, nil: TextDirection.ltr, notNil: TextDirection.rtl),
          child: ElevatedButton.icon(
            icon: SuperVisor.shared.nullable(willCheck: icon, nil: const SizedBox.shrink(), notNil: Icon(icon, color: foregroundColor ?? IColors.deepRacingGreen.apply)),
            style: _buttonStyle,
            onPressed: onTap,
            label: FittedBox(child: Text(title ?? ConstTexts.intance.none, style: ITextStyles.tall.apply.copyWith(color: foregroundColor ?? IColors.deepRacingGreen.apply))),
          ),
        ),
      );

  ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        shadowColor: MaterialStateProperty.all(IColors.athensGray.apply),
        backgroundColor: MaterialStateProperty.resolveWith((states) => states == MaterialState.pressed ? IColors.rossoCorsa.apply : backGorundColor ?? IColors.athensGray.apply),
      );
}

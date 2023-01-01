import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/utils/extensions.dart';
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
            icon: SuperVisor.shared.nullable(willCheck: icon, nil: const SizedBox.shrink(), notNil: Icon(icon, color: foregroundColor ?? CustomColor.deepRacingGreen.get)),
            style: _buttonStyle,
            onPressed: onTap,
            label: FittedBox(child: Text(title ?? ConstTexts.intance.none, style: ConstTextStyles.content.setUp.copyWith(color: foregroundColor ?? CustomColor.deepRacingGreen.get))),
          ),
        ),
      );

  ButtonStyle get _buttonStyle => ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        shadowColor: MaterialStateProperty.all(CustomColor.athensGray.get),
        backgroundColor: MaterialStateProperty.resolveWith((states) => states == MaterialState.pressed ? CustomColor.rossoCorsa.get : backGorundColor ?? CustomColor.athensGray.get),
      );
}

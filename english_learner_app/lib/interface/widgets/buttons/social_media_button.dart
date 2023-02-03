import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.onTap, this.width, this.height, required this.platform, this.margin});
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final SupportedPlatforms platform;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: margin ?? const EdgeInsets.symmetric(vertical: 2),
          width: width ?? Get.width,
          height: height ?? Get.height / 22,
          decoration: BoxDecoration(border: Border.all(width: 1.4), color: IColors.athensGray.apply, borderRadius: BorderRadius.circular(5)),
          child: FittedBox(child: Row(children: [Text(platform.name.capitalizeFirst.toString(), style: const TextStyle(fontSize: 10)), Icon(platform.apply, size: Get.height / 30)])),
        ),
      );
}

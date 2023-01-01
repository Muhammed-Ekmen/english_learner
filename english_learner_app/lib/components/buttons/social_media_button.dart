import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.onTap, this.width, this.height, required this.icon, required this.platform, this.margin});
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final IconData icon;
  final String platform;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(vertical: 2),
        width: width ?? Get.width,
        height: height ?? Get.height / 22,
        decoration: BoxDecoration(border: Border.all(width: 1.4), color: CustomColor.athensGray.get, borderRadius: BorderRadius.circular(5)),
        child: FittedBox(child: Row(children: [Text(platform, style: const TextStyle(fontSize: 10)), Icon(icon, size: Get.height / 30)])),
      ),
    );
  }
}

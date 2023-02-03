import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin IShaderMask {
  ShaderMask customShaderMask({required Widget shaderBody}) => ShaderMask(
        shaderCallback: (bounds) => LinearGradient(colors: [IColors.athensGray.apply, IColors.athensGray.apply], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(image: DecorationImage(image: CallImages.city.provider, fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken))),
            ),
            shaderBody
          ],
        ),
      );
}

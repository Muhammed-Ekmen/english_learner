import 'package:english_learner_app/helper/shader_mask.dart';
import 'package:english_learner_app/ui/splash/view_model/splash_view_model.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget with IShaderMask {
  SplashScreen({super.key});
  final SplashViewModel _splashViewModel = Get.put(SplashViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(body: customShaderMask(shaderBody: CallLotties.google.to(onLoaded: (value) => _splashViewModel.firstRunCheck())));
}

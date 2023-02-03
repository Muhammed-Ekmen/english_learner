import 'package:english_learner_app/interface/screens/splash/view_model/splash_view_model.dart';
import 'package:english_learner_app/utils/helper/shader_mask.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget with IShaderMask {
  SplashScreen({super.key});
  final SplashViewModel _splashViewModel = Get.put(SplashViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(body: customShaderMask(shaderBody: CallLotties.google.apply(onLoaded: (value) => _splashViewModel.firstRunCheck())));
}

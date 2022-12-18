import 'package:english_learner_app/routes/app_routes.dart';
import 'package:english_learner_app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: BaseRoutes.instance.getPages,
      theme: AppTheme.instance.theme,
      initialRoute: AppScreens.splash.to(),
    );
  }
}

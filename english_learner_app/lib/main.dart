import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/routes/app_routes.dart';
import 'package:english_learner_app/themes/app_theme.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget with BaseRoutes, AppTheme {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: ConstTexts.intance.appTitle,
        debugShowCheckedModeBanner: false,
        getPages: getPages,
        theme: customTheme,
        initialRoute: AppScreens.splash.path,
      );
}

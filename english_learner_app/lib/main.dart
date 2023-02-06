import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/config/routes/app_routes.dart';
import 'package:english_learner_app/config/themes/app_theme.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// set up the system bar color. it should be white.
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemUiOverlayStyle.light;
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
        initialRoute: IRoutes.splash.path,
      );
}

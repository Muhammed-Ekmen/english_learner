import 'package:english_learner_app/interface/home/view/home.dart';
import 'package:english_learner_app/interface/login/view/login.dart';
import 'package:english_learner_app/interface/on_board/view/on_board.dart';
import 'package:english_learner_app/interface/sign_in/view/sign_in.dart';
import 'package:english_learner_app/interface/splash/view/splash.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:get/get.dart';

abstract class BaseRoutes {
  final List<GetPage<dynamic>>? getPages = [
    GetPage(name: AppScreens.splash.path, page: () => SplashScreen()),
    GetPage(name: AppScreens.onBoard.path, page: () => OnBoardScreen()),
    GetPage(name: AppScreens.login.path, page: () => LoginScreen()),
    GetPage(name: AppScreens.signIn.path, page: () => SignInScreen()),
    GetPage(name: AppScreens.home.path, page: () => HomeScreen()),
  ];
}

import 'package:english_learner_app/ui/home/view/home.dart';
import 'package:english_learner_app/ui/login/view/login.dart';
import 'package:english_learner_app/ui/on_board/view/on_board.dart';
import 'package:english_learner_app/ui/sign_in/view/sign_in.dart';
import 'package:english_learner_app/ui/splash/view/splash.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:get/get.dart';

mixin BaseRoutes {
  final List<GetPage<dynamic>>? getPages = [
    GetPage(name: AppScreens.splash.to, page: () => SplashScreen()),
    GetPage(name: AppScreens.onBoard.to, page: () => OnBoardScreen()),
    GetPage(name: AppScreens.login.to, page: () => LoginScreen()),
    GetPage(name: AppScreens.signIn.to, page: () => SignInScreen()),
    GetPage(name: AppScreens.home.to, page: () => HomeScreen())
  ];
}

import 'package:english_learner_app/ui/on_board/view/on_board.dart';
import 'package:english_learner_app/ui/splash/view/splash.dart';
import 'package:get/get.dart';

class BaseRoutes {
  BaseRoutes._();

  static final BaseRoutes _route = BaseRoutes._();
  static BaseRoutes get instance => _route;

  List<GetPage<dynamic>>? getPages = [
    GetPage(name: AppScreens.splash.to(), page: () => const SplashScreen()),
    GetPage(name: AppScreens.onBoard.to(), page: () => const OnBoardScreen()),
  ];
}

enum AppScreens {
  splash,
  onBoard,
  home,
}

extension AppScreensExtension on AppScreens {
  to() => "/$name";
}

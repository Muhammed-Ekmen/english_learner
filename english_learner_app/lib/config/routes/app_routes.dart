import 'package:english_learner_app/interface/screens/home/view/home.dart';
import 'package:english_learner_app/interface/screens/login/view/login.dart';
import 'package:english_learner_app/interface/screens/on_board/view/on_board.dart';
import 'package:english_learner_app/interface/screens/sign_in/view/sign_in.dart';
import 'package:english_learner_app/interface/screens/splash/view/splash.dart';
import 'package:english_learner_app/interface/screens/user_interactive_screens/listen/view/listen_view.dart';
import 'package:english_learner_app/interface/screens/user_interactive_screens/read/view/read_view.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:get/get.dart';

abstract class BaseRoutes {
  final List<GetPage<dynamic>>? getPages = [
    GetPage(name: IRoutes.splash.path, page: () => SplashScreen()),
    GetPage(name: IRoutes.onBoard.path, page: () => OnBoardScreen()),
    GetPage(name: IRoutes.login.path, page: () => LoginScreen()),
    GetPage(name: IRoutes.signIn.path, page: () => SignInScreen()),
    GetPage(name: IRoutes.home.path, page: () => HomeScreen()),
    GetPage(name: IRoutes.read.path, page: () => ReadView()),
    GetPage(name: IRoutes.listen.path, page: () => ListenView()),
  ];
}

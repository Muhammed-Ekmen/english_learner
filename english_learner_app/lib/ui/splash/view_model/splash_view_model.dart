import 'package:english_learner_app/helper/get_storage_manager.dart';
import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  firstRunCheck() async {
    await Future.delayed(const Duration(seconds: 5));
    SuperVisor.shared.firstRun(
      firstRun: AppScreens.onBoard.go,
      notFirstRun: CoreStorage.instance.read(key: CoreStorageKeys.isLogin) == null ? AppScreens.login.go : AppScreens.home.go,
    );
  }
}


/*
first run
is login
*/
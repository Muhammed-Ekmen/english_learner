import 'package:english_learner_app/helper/get_storage_manager.dart';
import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  firstRunCheck() async {
    await Future.delayed(IDurations.high.apply);
    SuperVisor.shared.firstRun(
      firstRun: AppScreens.onBoard.go,
      notFirstRun: CoreStorage.instance.read(key: CoreStorageKeys.isLogin) == null ? AppScreens.login.go : AppScreens.home.go,
    );
  }
}

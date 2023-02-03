import 'package:english_learner_app/utils/helper/get_storage_manager.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  firstRunCheck() async {
    await Future.delayed(IDurations.high.apply);
    SuperVisor.shared.firstRun(
      firstRun: IRoutes.onBoard.go,
      notFirstRun: CoreStorage.instance.read(key: CoreStorageKeys.isLogin) == null ? IRoutes.login.go : IRoutes.home.go,
    );
  }
}

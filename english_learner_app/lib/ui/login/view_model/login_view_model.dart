import 'package:english_learner_app/utils/extensions.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  RxBool showPassword = RxBool(true);

  changePassword() => showPassword.value = !showPassword.value;
  createAnAccount() => AppScreens.signIn.go;
  forgetPassword() =>AppScreens.onBoard.go;
  login() => AppScreens.home.go;
  loginApple() {}
  loginGoogle() {}
  loginFacebook() {}
}

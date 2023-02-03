import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  RxBool showPassword = RxBool(true);
  changePassword() => showPassword.value = !showPassword.value;
  createAnAccount() => IRoutes.signIn.go;
  forgetPassword() => IRoutes.onBoard.go;
  login() => IRoutes.home.go;
  loginApple() {}
  loginGoogle() {}
  loginFacebook() {}
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:english_learner_app/interface/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/interface/widgets/buttons/social_media_button.dart';
import 'package:english_learner_app/interface/widgets/text_fields/user_info_text_field.dart';
import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/helper/shader_mask.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/interface/screens/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget with IShaderMask {
  LoginScreen({super.key});
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: IDeviceBehaviour.alert.setUp,
        child: Scaffold(
          body: customShaderMask(
            shaderBody: Padding(padding: IMeasures.screenOrientation.adjust, child: CustomScrollView(slivers: [sliverFillRemain])),
          ),
        ),
      );

  get sliverFillRemain => SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ConstTexts.intance.welcomeMessage, style: ITextStyles.short.apply),
            englishLearnerApp,
            const UserInfoTextField(typeKey: UserInfoTextFieldKey.email),
            passwordTextField,
            forgetPasswordAndLogin,
            SizedBox(height: Get.height / 5),
            socialMediaButtons,
            dividerAndOr,
            RegularButton(onTap: _loginViewModel.createAnAccount, title: ConstTexts.intance.createAnAccount.toUpperCase(), backGorundColor: IColors.rossoCorsa.apply),
          ],
        ),
      );

  get englishLearnerApp => FittedBox(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(ConstTexts.intance.appTitle, textStyle: ITextStyles.grande.apply, colors: [IColors.athensGray.apply, Colors.transparent])
          ],
        ),
      );

  get passwordTextField => Obx(() => UserInfoTextField(
        typeKey: UserInfoTextFieldKey.password,
        suffixIcon: SuperVisor.shared.binaryCondition(condition: _loginViewModel.showPassword.value == true, convenient: FontAwesomeIcons.eyeSlash, inconvenient: FontAwesomeIcons.eye),
        suffixOnPressed: _loginViewModel.changePassword,
        obscureText: _loginViewModel.showPassword.value,
      ));

  get forgetPasswordAndLogin => Row(
        children: [
          Expanded(flex: 50, child: RegularButton(onTap: _loginViewModel.forgetPassword, title: ConstTexts.intance.forgetYourEmailOrPassword, width: Get.width / 2, height: Get.height / 15, righDirection: true, icon: FontAwesomeIcons.userShield)),
          const Spacer(flex: 1),
          Expanded(flex: 25, child: RegularButton(onTap: _loginViewModel.login, title: ConstTexts.intance.login, width: Get.width / 2, height: Get.height / 15, icon: FontAwesomeIcons.arrowRightToBracket, righDirection: true)),
        ],
      );

  get socialMediaButtons => Row(
        children: [
          Expanded(child: SocialMediaButton(onTap: _loginViewModel.loginApple, platform: SupportedPlatforms.apple)),
          Expanded(child: SocialMediaButton(onTap: _loginViewModel.loginGoogle, platform: SupportedPlatforms.google)),
          Expanded(child: SocialMediaButton(onTap: _loginViewModel.loginFacebook, platform: SupportedPlatforms.facebook)),
        ],
      );

  get dividerAndOr => Row(
        children: [
          Expanded(flex: 6, child: ITools.divider.call),
          Expanded(flex: 2, child: Text(ConstTexts.intance.or, style: ITextStyles.tall.apply, textAlign: TextAlign.center)),
          Expanded(flex: 6, child: ITools.divider.call),
        ],
      );
}

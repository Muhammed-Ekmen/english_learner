import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:english_learner_app/components/buttons/regular_button.dart';
import 'package:english_learner_app/components/buttons/social_media_button.dart';
import 'package:english_learner_app/components/text_fields/user_info_text_field.dart';
import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/helper/shader_mask.dart';
import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/ui/login/view_model/login_view_model.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget with IShaderMask {
  LoginScreen({super.key});
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) => SafeArea(
        child: WillPopScope(
          onWillPop: WillPopBehaviour.alert.action,
          child: Scaffold(body: customShaderMask(shaderBody: Padding(padding: ConstSizes.screenHorizantal.measure, child: CustomScrollView(slivers: [sliverFillRemain])))),
        ),
      );

  get sliverFillRemain => SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ConstTexts.intance.welcomeMessage, style: TextStyle(color: CustomColor.athensGray.get, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, fontSize: 24)),
            englishLearnerApp,
            const UserInfoTextField(typeKey: UserInfoTextFieldKey.email),
            passwordTextField,
            forgetPasswordAndLogin,
            SizedBox(height: Get.height / 5),
            socialMediaButtons,
            dividerAndOr,
            RegularButton(onTap: _loginViewModel.createAnAccount, title: ConstTexts.intance.createAnAccount.toUpperCase(), backGorundColor: CustomColor.rossoCorsa.get),
          ],
        ),
      );

  get englishLearnerApp => FittedBox(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(ConstTexts.intance.appTitle, textStyle: ConstTextStyles.title.setUp, colors: [CustomColor.athensGray.get, Colors.transparent])
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
          Expanded(
            flex: 50,
            child: RegularButton(
              onTap: _loginViewModel.forgetPassword,
              title: ConstTexts.intance.forgetYourEmailOrPassword,
              width: Get.width / 2,
              height: Get.height / 15,
              righDirection: true,
              icon: FontAwesomeIcons.userShield,
            ),
          ),
          const Spacer(flex: 1),
          Expanded(flex: 25, child: RegularButton(onTap: _loginViewModel.login, title: ConstTexts.intance.login, width: Get.width / 2, height: Get.height / 15, icon: FontAwesomeIcons.arrowRightToBracket, righDirection: true)),
        ],
      );

  get socialMediaButtons => Row(
        children: [
          Expanded(child: SocialMediaButton(onTap: _loginViewModel.loginApple, icon: FontAwesomeIcons.ccApplePay, platform: SupportedPlatforms.apple.name.capitalizeFirst ?? "")),
          Expanded(child: SocialMediaButton(onTap: _loginViewModel.loginGoogle, icon: FontAwesomeIcons.squareGooglePlus, platform: SupportedPlatforms.google.name.capitalizeFirst ?? "")),
          Expanded(child: SocialMediaButton(onTap: _loginViewModel.loginFacebook, icon: FontAwesomeIcons.squareFacebook, platform: SupportedPlatforms.facebook.name.capitalizeFirst ?? "")),
        ],
      );

  get dividerAndOr => Row(
        children: [
          Expanded(flex: 6, child: divider),
          Expanded(flex: 2, child: Text(ConstTexts.intance.or, style: ConstTextStyles.content.setUp, textAlign: TextAlign.center)),
          Expanded(flex: 6, child: divider),
        ],
      );

  get divider => Divider(height: 0, color: CustomColor.athensGray.get, thickness: 3);
}

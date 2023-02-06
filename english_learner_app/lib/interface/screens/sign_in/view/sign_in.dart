import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:english_learner_app/interface/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/interface/widgets/text_fields/user_info_text_field.dart';
import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/helper/shader_mask.dart';
import 'package:english_learner_app/interface/screens/sign_in/view_model/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget with IShaderMask {
  SignInScreen({super.key});
  final SignInViewModel _signInViewModel = Get.put(SignInViewModel());
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: IDeviceBehaviour.back.setUp,
        child: Scaffold(body: customShaderMask(shaderBody: _customScrollView)),
      );

  get _customScrollView => CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: IMeasures.screenOrientation.adjust,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [titleAndSubtitle, emailPassordTextFields, buttons],
              ),
            ),
          ),
        ],
      );

  get titleAndSubtitle => Column(
        children: [
          FittedBox(child: Text(ConstTexts.intance.createAnAccount, style: ITextStyles.grande.apply)),
          FittedBox(alignment: Alignment.center, fit: BoxFit.fitWidth, child: Text(ConstTexts.intance.verificationEmail.capitalize ?? "", style: ITextStyles.short.apply)),
        ],
      );

  get emailPassordTextFields => Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: Text(ConstTexts.intance.email, style: ITextStyles.tall.apply)),
          UserInfoTextField(typeKey: UserInfoTextFieldKey.email, margin: EdgeInsets.symmetric(vertical: Get.height / 100)),
          Align(alignment: Alignment.centerLeft, child: Text(ConstTexts.intance.password, style: ITextStyles.tall.apply)),
          UserInfoTextField(typeKey: UserInfoTextFieldKey.password, margin: EdgeInsets.symmetric(vertical: Get.height / 100)),
          ITools.divider.call,
        ],
      );

  get buttons => Row(
        children: [
          Expanded(flex: 6, child: RegularButton(onTap: _signInViewModel.previousOnTap, title: ConstTexts.intance.previous, icon: FontAwesomeIcons.backwardStep)),
          const Spacer(flex: 1),
          Expanded(flex: 12, child: RegularButton(onTap: _signInViewModel.createOnTap, title: ConstTexts.intance.create, backGorundColor: IColors.rossoCorsa.apply, icon: FontAwesomeIcons.creativeCommonsBy, righDirection: true)),
        ],
      );
}

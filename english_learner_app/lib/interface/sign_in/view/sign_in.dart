import 'package:english_learner_app/tools/enums.dart';
import 'package:english_learner_app/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/widgets/text_fields/user_info_text_field.dart';
import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/helper/shader_mask.dart';
import 'package:english_learner_app/interface/sign_in/view_model/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget with IShaderMask {
  SignInScreen({super.key});
  final SignInViewModel _signInViewModel = Get.put(SignInViewModel());
  @override
  Widget build(BuildContext context) => WillPopScope(onWillPop: WillPopBehaviour.back.apply, child: Scaffold(body: customShaderMask(shaderBody: CustomScrollView(slivers: [_sliverFillRemain]))));

  get _sliverFillRemain => SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: ConstSizes.screenHorizantal.apply,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [titleAndSubtitle, emailPassordTextFields, buttons]),
        ),
      );

  get titleAndSubtitle => Column(
        children: [
          Text(ConstTexts.intance.createAnAccount, style: ConstTextStyles.title.apply),
          FittedBox(alignment: Alignment.center, fit: BoxFit.fitWidth, child: Text(ConstTexts.intance.verificationEmail.capitalize ?? "", style: ConstTextStyles.subTitle.apply)),
        ],
      );

  get emailPassordTextFields => Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: Text(ConstTexts.intance.email, style: ConstTextStyles.content.apply)),
          const UserInfoTextField(typeKey: UserInfoTextFieldKey.email),
          Align(alignment: Alignment.centerLeft, child: Text(ConstTexts.intance.password, style: ConstTextStyles.content.apply)),
          const UserInfoTextField(typeKey: UserInfoTextFieldKey.password),
          divider,
        ],
      );

  get buttons => Row(
        children: [
          Expanded(flex: 6, child: RegularButton(onTap: _signInViewModel.previousOnTap, title: ConstTexts.intance.previous, icon: FontAwesomeIcons.backwardStep)),
          const Spacer(flex: 1),
          Expanded(flex: 12, child: RegularButton(onTap: _signInViewModel.createOnTap, title: ConstTexts.intance.create, backGorundColor: CustomColor.rossoCorsa.apply, icon: FontAwesomeIcons.creativeCommonsBy, righDirection: true)),
        ],
      );

  get divider => Divider(height: 15, color: CustomColor.athensGray.apply, thickness: 4);
}

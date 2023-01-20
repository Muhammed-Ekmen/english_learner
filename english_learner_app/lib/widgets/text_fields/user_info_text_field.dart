import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserInfoTextField extends StatelessWidget {
  const UserInfoTextField({super.key, required this.typeKey, this.suffixIcon, this.suffixOnPressed, this.obscureText});
  final UserInfoTextFieldKey typeKey;
  final IconData? suffixIcon;
  final void Function()? suffixOnPressed;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: Get.width,
        child: TextFormField(
          cursorColor: Colors.black,
          validator: _validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText ?? false,
          obscuringCharacter: "•",
          decoration: decoration,
        ),
      );

  get decoration => InputDecoration(
        errorStyle: ConstTextStyles.description.apply.copyWith(color: CustomColor.rossoCorsa.apply),
        constraints: BoxConstraints(minHeight: Get.height / 13, maxHeight: Get.height / 9),
        suffixIcon: SuperVisor.shared.binaryCondition(condition: typeKey == UserInfoTextFieldKey.password, inconvenient: null, convenient: IconButton(icon: Icon(suffixIcon, color: Colors.black), onPressed: suffixOnPressed)),
        prefixIcon: Icon(SuperVisor.shared.binaryCondition(condition: typeKey == UserInfoTextFieldKey.email, convenient: Icons.email, inconvenient: FontAwesomeIcons.key), color: CustomColor.deepRacingGreen.apply),
        hintStyle: ConstTextStyles.description.apply.copyWith(color: CustomColor.deepRacingGreen.apply),
        filled: true,
        contentPadding: EdgeInsets.zero,
        fillColor: CustomColor.athensGray.apply,
        hintText: SuperVisor.shared.binaryCondition(condition: typeKey == UserInfoTextFieldKey.email, convenient: ConstTexts.intance.email, inconvenient: ConstTexts.intance.password),
        focusedBorder: regularBorder,
        border: regularBorder,
        enabledBorder: regularBorder,
        disabledBorder: regularBorder,
        errorBorder: regularBorder,
        focusedErrorBorder: regularBorder,
      );

  get regularBorder => OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(4));

  String? _validator(value) {
    if (typeKey == UserInfoTextFieldKey.email) {
      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value ?? "")) {
        return "${typeKey.name} ${ConstTexts.intance.invalidWarning}".capitalize;
      }
    } else {
      if (value?.isEmpty == true) {
        return "${typeKey.name} ${ConstTexts.intance.cannotBeEmptyWarning}".capitalize;
      } else if (value?.contains(" ") == true) {
        return "${typeKey.name} ${ConstTexts.intance.characterWarning}".capitalize;
      }
    }
    return null;
  }
}

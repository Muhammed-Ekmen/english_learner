import 'package:english_learner_app/utils/tools/custom_decorations.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:english_learner_app/interface/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/helper/shader_mask.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/interface/screens/on_board/view_model/on_board_view_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OnBoardScreen extends StatelessWidget with IShaderMask {
  OnBoardScreen({super.key});
  final OnBoardViewModel _onBoardviewModel = Get.put(OnBoardViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(extendBodyBehindAppBar: false, body: customShaderMask(shaderBody: _body()));

  _body() => Container(
        width: Get.width,
        padding: IMeasures.screenOrientation.adjust,
        child: PageView.builder(
          controller: _onBoardviewModel.pageCtrl,
          itemCount: CallLotties.values.length - 1,
          itemBuilder: _itemBuilder,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: _onBoardviewModel.onPageChanged,
        ),
      );

  Widget _itemBuilder(context, index) => Obx(
        () => Column(
          children: [
            const Spacer(flex: 1),
            Expanded(flex: 5, child: CallLotties.values[index + 1].apply()),
            _description(index),
            const Spacer(flex: 2),
            _backAndNext(),
            const Spacer(flex: 1),
          ],
        ),
      );

  Expanded _description(int index) => Expanded(
        flex: 3,
        child: Container(
          width: Get.width,
          padding: IMeasures.screenOrientation.adjust,
          decoration: IBoxDecoration.header.regular,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(ConstTexts.intance.onBoardTitles[index], style: ITextStyles.demi.apply.copyWith(color: IColors.deepRacingGreen.apply)),
                Text(ConstTexts.intance.onBoardDescriptions[index].capitalize ?? ConstTexts.intance.none, maxLines: 10, textAlign: TextAlign.center, style: ITextStyles.short.apply),
              ],
            ),
          ),
        ),
      );

  Expanded _backAndNext() => Expanded(
        flex: 1,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: SuperVisor.shared.binaryCondition(
                condition: _onBoardviewModel.currentPage.value != 0,
                inconvenient: const SizedBox.shrink(),
                convenient: RegularButton(onTap: _onBoardviewModel.previous, icon: FontAwesomeIcons.backwardStep, title: ConstTexts.intance.previous),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 6,
              child: RegularButton(
                onTap: _onBoardviewModel.next,
                backGorundColor: IColors.rossoCorsa.apply,
                icon: SuperVisor.shared.binaryCondition(condition: _onBoardviewModel.currentPage.value != 2, convenient: FontAwesomeIcons.forward, inconvenient: FontAwesomeIcons.forwardFast),
                title: SuperVisor.shared.binaryCondition(condition: _onBoardviewModel.currentPage.value != 2, convenient: ConstTexts.intance.next, inconvenient: ConstTexts.intance.done),
              ),
            ),
          ],
        ),
      );
}

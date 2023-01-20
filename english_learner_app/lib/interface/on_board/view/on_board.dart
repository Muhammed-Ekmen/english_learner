import 'package:english_learner_app/tools/custom_decorations.dart';
import 'package:english_learner_app/tools/enums.dart';
import 'package:english_learner_app/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/constants/const_texts.dart';
import 'package:english_learner_app/helper/shader_mask.dart';
import 'package:english_learner_app/helper/supervisor.dart';
import 'package:english_learner_app/interface/on_board/view_model/on_board_view_model.dart';
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
        padding: ConstSizes.screenHorizantal.apply,
        child: PageView.builder(
          controller: _onBoardviewModel.pageCtrl,
          itemCount: CallLotties.values.length - 1,
          itemBuilder: _itemBuilder,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: _onBoardviewModel.onPageChanged,
        ),
      );

  Widget _itemBuilder(context, index) => Obx(() => Column(children: [const Spacer(flex: 1), Expanded(flex: 5, child: CallLotties.values[index + 1].apply()), _description(index), const Spacer(flex: 2), _backAndNext(), const Spacer(flex: 1)]));

  Expanded _description(int index) => Expanded(
        flex: 3,
        child: Container(
          width: Get.width,
          padding: ConstSizes.screenHorizantal.apply,
          decoration: IBoxDecoration.header.regular,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(ConstTexts.intance.onBoardTitles[index], style: ConstTextStyles.subTitle.apply.copyWith(color: CustomColor.deepRacingGreen.apply)),
                Text(ConstTexts.intance.onBoardDescriptions[index].capitalize ?? ConstTexts.intance.none, maxLines: 10, textAlign: TextAlign.center, style: ConstTextStyles.description.apply),
              ],
            ),
          ),
        ),
      );

  Expanded _backAndNext() => Expanded(
        flex: 1,
        child: Row(
          children: [
            Expanded(flex: 4, child: SuperVisor.shared.binaryCondition(condition: _onBoardviewModel.currentPage.value != 0, inconvenient: SizedBox.fromSize(), convenient: RegularButton(onTap: _onBoardviewModel.previous, icon: FontAwesomeIcons.backwardStep, title: ConstTexts.intance.previous))),
            const Spacer(flex: 1),
            Expanded(
              flex: 6,
              child: RegularButton(
                onTap: _onBoardviewModel.next,
                backGorundColor: CustomColor.rossoCorsa.apply,
                icon: SuperVisor.shared.binaryCondition(condition: _onBoardviewModel.currentPage != 2, convenient: FontAwesomeIcons.forward, inconvenient: FontAwesomeIcons.forwardFast),
                title: SuperVisor.shared.binaryCondition(condition: _onBoardviewModel.currentPage != 2, convenient: ConstTexts.intance.next, inconvenient: ConstTexts.intance.done),
              ),
            ),
          ],
        ),
      );
}

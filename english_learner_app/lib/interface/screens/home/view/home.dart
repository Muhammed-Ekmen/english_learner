import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:english_learner_app/interface/widgets/buttons/magic_button.dart';
import 'package:english_learner_app/interface/widgets/cards/menu_card.dart';
import 'package:english_learner_app/interface/widgets/cards/profile_card.dart';
import 'package:english_learner_app/interface/widgets/cards/progress_card.dart';
import 'package:english_learner_app/interface/widgets/selector/scroll_pointer.dart';
import 'package:english_learner_app/src/constants/const_texts.dart';
import 'package:english_learner_app/utils/helper/shader_mask.dart';
import 'package:english_learner_app/interface/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget with IShaderMask {
  HomeScreen({super.key});
  final HomeViewModel _homeViewModel = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(
        body: customShaderMask(
          shaderBody: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: IMeasures.screenOrientation.adjust,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _magicButtons,
                      Text(ConstTexts.intance.menu, style: ITextStyles.tall.apply),
                      ProfileCard(emailOrUsername: "Semih E.", imageOntap: _homeViewModel.profileImageOnTap),
                      Divider(color: IColors.athensGray.apply, height: 0, thickness: 1),
                      Text(ConstTexts.intance.quickInfo, style: ITextStyles.tall.apply),
                      ProgressCard(reviewButtonOnPressed: _homeViewModel.reviewOnTap),
                      Text(ConstTexts.intance.menu, style: ITextStyles.tall.apply),
                      MenuCard(scrollCtrl: _homeViewModel.scrollController, onItemChanged: (index) => _homeViewModel.pointerIndexValue.value = index, onPressed: _homeViewModel.menuCardOnTap),
                      Scrollpointer(pointerIndex: _homeViewModel.pointerIndexValue),
                      Align(alignment: Alignment.center, child: Text(ConstTexts.intance.allRightsReserves, style: ITextStyles.demi.apply)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  get _magicButtons => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MagicButton(widthModel: _homeViewModel.redClose, onTap: _homeViewModel.redCloseOnTap, typeKey: MagicButtonKeys.logOut),
            MagicButton(widthModel: _homeViewModel.yellowInfo, onTap: _homeViewModel.yellowInfoOnTap, typeKey: MagicButtonKeys.info),
            MagicButton(widthModel: _homeViewModel.greenSetting, onTap: _homeViewModel.greenSettingOnTap, typeKey: MagicButtonKeys.setting),
          ],
        ),
      );
}

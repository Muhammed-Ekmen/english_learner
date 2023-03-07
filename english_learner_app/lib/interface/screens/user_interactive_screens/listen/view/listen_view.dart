import 'package:english_learner_app/interface/screens/user_interactive_screens/listen/view_model/listen_view_model.dart';
import 'package:english_learner_app/interface/widgets/buttons/regular_button.dart';
import 'package:english_learner_app/utils/helper/supervisor.dart';
import 'package:english_learner_app/utils/tools/custom_decorations.dart';
import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ListenView extends StatelessWidget {
  ListenView({super.key});
  final ListenViewModel _listenViewModel = Get.put(ListenViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: IMeasures.screenOrientation.adjust,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.backwardFast, color: IColors.rossoCorsa.apply),
                        ),
                      ),
                      SizedBox(height: Get.height / 10),
                      Text("Listening...", style: ITextStyles.grande.apply),
                      GestureDetector(
                        onTap: () {
                          _listenViewModel.multimediaStatue.value = !_listenViewModel.multimediaStatue.value;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: Get.height / 50),
                          width: Get.width,
                          height: Get.height / 8,
                          decoration: IBoxDecoration.header.glassAppearance,
                          child: SuperVisor.shared.binaryCondition(
                            condition: _listenViewModel.multimediaStatue.value == false,
                            convenient: AnimatedContainer(
                              duration: IDurations.short.adjust,
                              margin: EdgeInsets.symmetric(
                                vertical: Get.height / 19,
                                horizontal: SuperVisor.shared.binaryCondition(
                                  condition: _listenViewModel.multimediaStatue.value == false,
                                  convenient: Get.width / 10,
                                  inconvenient: Get.width,
                                ),
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [IColors.rossoCorsa.apply, IColors.deepRacingGreen.apply]),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            inconvenient: CallLotties.listening.apply(),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height / 3.95,
                        decoration: IBoxDecoration.header.glassAppearance,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: 3,
                          itemBuilder: (context, index) => Container(
                            width: Get.width,
                            height: Get.height / 17,
                            margin: EdgeInsets.all(Get.width / 45),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Get.width / 50),
                              color: IColors.deepRacingGreen.apply,
                            ),
                            child: Row(
                              children: [
                                Expanded(flex: 1, child: Icon(FontAwesomeIcons.pencil, color: IColors.athensGray.apply)),
                                Expanded(flex: 6, child: Text("Pencil", style: ITextStyles.tall.apply)),
                                Expanded(flex: 1, child: Icon(FontAwesomeIcons.chevronRight, color: IColors.athensGray.apply)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      RegularButton(onTap: () {}, title: "Skip", margin: EdgeInsets.only(top: Get.height / 10))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

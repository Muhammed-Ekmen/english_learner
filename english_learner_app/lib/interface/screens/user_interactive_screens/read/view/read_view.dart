import 'package:english_learner_app/interface/screens/user_interactive_screens/read/view_model/read_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadView extends StatelessWidget {
  ReadView({super.key});
  final ReadViewModel _readViewModel = Get.put(ReadViewModel());
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("asdads"),
        ),
      );
}

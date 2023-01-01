import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
part '../utils/enums.dart';

extension CallLottiesExtension on CallLotties {
  to({void Function(LottieComposition)? onLoaded}) => LottieBuilder.asset("assets/lotties/${name}_lottie.json", repeat: true, onLoaded: onLoaded);
}

extension CallImagesExtension on CallImages {
  get provider => AssetImage("assets/images/$name.jpg");
  get cache => Image.asset("assets/images/$name.jpg", fit: BoxFit.cover);
}

extension CustomColorExtension on CustomColor {
  Color get get {
    switch (this) {
      case CustomColor.rossoCorsa:
        return const Color(0xFFD40000);
      case CustomColor.corduroy:
        return const Color(0xFF666b6b);
      case CustomColor.deepRacingGreen:
        return const Color(0xFF040605);
      case CustomColor.athensGray:
        return const Color(0xFFe9edf0);
      case CustomColor.pumpkin:
        return const Color(0xFFFE8216);
      case CustomColor.greenHaze:
        return const Color(0xFF009A4E);
      default:
        return const Color(0x000fffff);
    }
  }
}

extension AppScreensExtension on AppScreens {
  get to => "/$name";
  get go => Get.offNamed("/$name");
}

extension WillPopBehaviourExtension on WillPopBehaviour {
  get action {
    switch (this) {
      case WillPopBehaviour.back:
        return () {
          Get.offNamed(Get.previousRoute);
          return Future.value(false);
        };
      case WillPopBehaviour.alert:
        return () {
          Get.snackbar("EXIT ALERT", "coming soon");
          return Future.value(false);
        };
      default:
        return () => Future.value(false);
    }
  }
}

extension MagicButtonKeysExtension on MagicButtonKeys {
  get call {
    switch (this) {
      case MagicButtonKeys.logOut:
        return FontAwesomeIcons.rightFromBracket;
      case MagicButtonKeys.info:
        return FontAwesomeIcons.circleInfo;
      case MagicButtonKeys.setting:
        return FontAwesomeIcons.gear;
      default:
        return FontAwesomeIcons.explosion;
    }
  }
}

extension ConstSizesExtension on ConstSizes {
  get measure {
    switch (this) {
      case ConstSizes.screenHorizantal:
        return EdgeInsets.symmetric(horizontal: Get.width / 15, vertical: Get.height / 20);
      case ConstSizes.cardVertical:
        return EdgeInsets.symmetric(vertical: Get.height / 50);
      default:
        return null;
    }
  }
}

extension ConstTextStylesExtension on ConstTextStyles {
  TextStyle get setUp {
    switch (this) {
      case ConstTextStyles.title:
        return TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: CustomColor.athensGray.get, fontSize: 46);
      case ConstTextStyles.subTitle:
        return TextStyle(color: CustomColor.corduroy.get, decoration: TextDecoration.underline, fontStyle: FontStyle.italic);
      case ConstTextStyles.content:
        return TextStyle(color: CustomColor.athensGray.get, fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic);
      case ConstTextStyles.description:
        return TextStyle(color: CustomColor.athensGray.get, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, fontSize: 12);
      default:
        return const TextStyle();
    }
  }
}

extension PuzzleMenuItemsExtension on PuzzleMenuItems {
  get supplies {
    switch (this) {
      case PuzzleMenuItems.chat:
        return FontAwesomeIcons.comments;
      case PuzzleMenuItems.listen:
        return FontAwesomeIcons.headphonesSimple;
      case PuzzleMenuItems.lyric:
        return FontAwesomeIcons.music;
      case PuzzleMenuItems.movie:
        return FontAwesomeIcons.clapperboard;
      case PuzzleMenuItems.read:
        return FontAwesomeIcons.readme;
      case PuzzleMenuItems.translate:
        return FontAwesomeIcons.language;
      default:
        return FontAwesomeIcons.triangleExclamation;
    }
  }
}

// extension SuperVisorExtension on SuperVisorTrial {
//   get process => {
//     switch (this) {
//       case SuperVisorTrial.nullable:
//         return _nullable;
//       default:
//         return null;
//     }
//   };

//   _nullable({required dynamic willCheck, dynamic nil, dynamic notNil}) => willCheck == null ? nil : notNil;
// }

part of '../tools/enums.dart';

extension CallLottiesExt on CallLotties {
  LottieBuilder apply({void Function(LottieComposition)? onLoaded}) => LottieBuilder.asset("assets/lotties/${name}_lottie.json", repeat: true, onLoaded: onLoaded);
}

extension CallImagesExt on CallImages {
  get provider => AssetImage("assets/images/$name.jpg");
  get cache => Image.asset("assets/images/$name.jpg", fit: BoxFit.cover);
}

extension IColorExt on IColors {
  Color get apply {
    switch (this) {
      case IColors.rossoCorsa:
        return const Color(0xFFD40000);
      case IColors.corduroy:
        return const Color(0xFF666b6b);
      case IColors.deepRacingGreen:
        return const Color(0xFF040605);
      case IColors.athensGray:
        return const Color(0xFFe9edf0);
      case IColors.pumpkin:
        return const Color(0xFFFE8216);
      case IColors.greenHaze:
        return const Color(0xFF009A4E);
      default:
        return const Color(0x000fffff);
    }
  }
}

extension IRoutesExt on IRoutes {
  String get path {
    switch (this) {
      case IRoutes.splash:
        return "/";
      default:
        return "/$name";
    }
  }

  get go => Get.offNamed("/$name");
}

extension IDeviceBehaviourExt on IDeviceBehaviour {
  get setUp {
    switch (this) {
      case IDeviceBehaviour.back:
        return () {
          Get.offNamed(Get.previousRoute);
          return Future.value(false);
        };
      case IDeviceBehaviour.alert:
        return () {
          Get.snackbar("EXIT ALERT", "coming soon");
          return Future.value(false);
        };
      case IDeviceBehaviour.nix:
        return () => Future.value(false);
      default:
        return () => Future.value(false);
    }
  }
}

extension MagicButtonKeysExtension on MagicButtonKeys {
  IconData get apply {
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

extension IMeasuresExt on IMeasures {
  EdgeInsetsGeometry get adjust {
    switch (this) {
      case IMeasures.screenOrientation:
        return EdgeInsets.symmetric(horizontal: Get.width / 15, vertical: Get.height / 20);
      case IMeasures.cardVertical:
        return EdgeInsets.symmetric(vertical: Get.height / 50);
      default:
        return EdgeInsets.zero;
    }
  }
}

extension ITextStylesExt on ITextStyles {
  TextStyle get apply {
    switch (this) {
      case ITextStyles.grande:
        return TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: IColors.athensGray.apply, fontSize: 46);
      case ITextStyles.demi:
        return TextStyle(color: IColors.corduroy.apply, decoration: TextDecoration.underline, fontStyle: FontStyle.italic, fontSize: 9);
      case ITextStyles.tall:
        return TextStyle(color: IColors.athensGray.apply, fontSize: 14, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic);
      case ITextStyles.short:
        return TextStyle(color: IColors.athensGray.apply, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, fontSize: 12);
      default:
        return const TextStyle();
    }
  }
}

extension PuzzleMenuItemsExtension on PuzzleMenuItems {
  IconData get apply {
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

extension IDurationExt on IDurations {
  Duration get adjust {
    switch (this) {
      case IDurations.grande:
        return const Duration(milliseconds: 250);
      case IDurations.demi:
        return const Duration(milliseconds: 500);
      case IDurations.short:
        return const Duration(seconds: 2);
      case IDurations.tall:
        return const Duration(seconds: 5);
      default:
        return const Duration();
    }
  }
}

extension SupportedPlatformExt on SupportedPlatforms {
  IconData get apply {
    switch (this) {
      case SupportedPlatforms.apple:
        return FontAwesomeIcons.ccApplePay;
      case SupportedPlatforms.facebook:
        return FontAwesomeIcons.squareFacebook;
      case SupportedPlatforms.google:
        return FontAwesomeIcons.squareGooglePlus;
      default:
        return FontAwesomeIcons.info;
    }
  }
}

extension IToolsExt on ITools {
  get call {
    switch (this) {
      case ITools.divider:
        return Divider(height: 0, color: IColors.athensGray.apply, thickness: 2);
      default:
        return const SizedBox.shrink();
    }
  }
}

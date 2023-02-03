import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:flutter/material.dart';

class IBoxDecoration {
  IBoxDecoration._();
  static final IBoxDecoration _hinderDecoration = IBoxDecoration._();
  static IBoxDecoration get header => _hinderDecoration;

  BoxDecoration regular = BoxDecoration(
    color: IColors.athensGray.apply,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: IColors.deepRacingGreen.apply, width: 5, strokeAlign: StrokeAlign.outside),
  );

  BoxDecoration get glassAppearance => BoxDecoration(
        color: IColors.athensGray.apply.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: IColors.deepRacingGreen.apply, width: 5, strokeAlign: StrokeAlign.outside),
        boxShadow: [BoxShadow(color: IColors.athensGray.apply, offset: const Offset(1, 1), blurRadius: 12)],
      );
}

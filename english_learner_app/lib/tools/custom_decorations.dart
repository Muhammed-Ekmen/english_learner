import 'package:english_learner_app/tools/enums.dart';
import 'package:flutter/material.dart';

class IBoxDecoration {
  IBoxDecoration._();
  static final IBoxDecoration _hinderDecoration = IBoxDecoration._();
  static IBoxDecoration get header => _hinderDecoration;

  BoxDecoration regular = BoxDecoration(
    color: CustomColor.athensGray.apply,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: CustomColor.deepRacingGreen.apply, width: 5, strokeAlign: StrokeAlign.outside),
  );

  BoxDecoration get glassAppearance => BoxDecoration(
        color: CustomColor.athensGray.apply.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: CustomColor.deepRacingGreen.apply, width: 5, strokeAlign: StrokeAlign.outside),
        boxShadow: [BoxShadow(color: CustomColor.athensGray.apply, offset: const Offset(1, 1), blurRadius: 12)],
      );
}

import 'package:english_learner_app/helper/get_storage_manager.dart';
import 'package:english_learner_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SuperVisor {
  SuperVisor._();

  static final SuperVisor _superVisor = SuperVisor._();
  static SuperVisor get shared => _superVisor;

  nullable({required dynamic willCheck, dynamic nil, dynamic notNil}) => willCheck == null ? nil : notNil;
  empty({required dynamic willCheck, dynamic empty, dynamic notEmpty}) => willCheck.isEmpty ? empty : notEmpty;
  loading({required ready}) => _loadingStatue.value == true ? _indicator : ready;
  firstRun({required dynamic firstRun, required dynamic notFirstRun}) => CoreStorage.instance.read(key: CoreStorageKeys.firstRun) != null ? notFirstRun : firstRun;
  binaryCondition({required dynamic condition, dynamic convenient, dynamic inconvenient}) => condition ? convenient : inconvenient;

  //TOOLS
  changeStatue() => _loadingStatue.value = !_loadingStatue.value;
  final RxBool _loadingStatue = RxBool(false);
  get _indicator => const Center(child: CircularProgressIndicator.adaptive());
}

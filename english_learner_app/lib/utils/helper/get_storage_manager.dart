import 'package:english_learner_app/utils/tools/enums.dart';
import 'package:get_storage/get_storage.dart';

class CoreStorage {
  CoreStorage._();
  static final CoreStorage _coreStorage = CoreStorage._();
  static CoreStorage get instance => _coreStorage;

  final GetStorage _getStorage = GetStorage();
  //SAVE DATA
  save({required CoreStorageKeys key, required String object}) async {
    await _getStorage.write(key.name, object);
  }

  //GET DATA
  read({required CoreStorageKeys key}) => _getStorage.read(key.name);
}

import 'package:covid_overcoming/values/constant/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:sp_util/sp_util.dart';

abstract class AppPref {
  Future<void> saveFirstTimeInit(bool isFirstTime);
  Future<bool> getFirstTimeInit();
}

@LazySingleton(as: AppPref)
class AppPrefImpl implements AppPref {
  @override
  Future<void> saveFirstTimeInit(bool isFirstTime) async {
    SpUtil.putBool(KEY_FIRST_TIME_INIT, isFirstTime);
  }

  @override
  Future<bool> getFirstTimeInit() async {
    return SpUtil.getBool(KEY_FIRST_TIME_INIT, defValue: true) ?? true;
  }
}

import 'package:covid_overcoming/data/datasource/local/pref/preferences_keys.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sp_util/sp_util.dart';

abstract class AppPreferences {
  Future<bool> saveFirstTimeInit(bool isFirstTime);

  Future<bool> getFirstTimeInit();

  Future<bool> saveUser(UserModel userModel);

  Future<UserModel> getUser();

  Future<bool> clear();
}

@LazySingleton(as: AppPreferences)
class AppPreferencesImpl implements AppPreferences {
  @override
  Future<bool> saveFirstTimeInit(bool isFirstTime) async {
    final res = await SpUtil.putBool(
      PreferencesKeys.firstTimeInit,
      isFirstTime,
    );
    return res ?? false;
  }

  @override
  Future<bool> getFirstTimeInit() async {
    final res = SpUtil.getBool(
      PreferencesKeys.firstTimeInit,
      defValue: true,
    );
    return res ?? true;
  }

  @override
  Future<bool> saveUser(UserModel userModel) async {
    final res = await SpUtil.putObject(
      PreferencesKeys.user,
      userModel.toJson(),
    );
    return res ?? false;
  }

  @override
  Future<UserModel> getUser() async {
    final res = SpUtil.getObject(
      PreferencesKeys.user,
    ) as Map<String, dynamic>;
    return UserModel.fromJson(res);
  }

  @override
  Future<bool> clear() async {
    final res = await SpUtil.clear();
    return res ?? false;
  }
}

import 'package:covid_overcoming/data/datasource/local/pref/preferences_keys.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sp_util/sp_util.dart';

abstract class AppPreferences {
  Future<bool> saveFirstTimeInit(bool isFirstTime);

  Future<bool> getFirstTimeInit();

  Future<bool> saveAccount(AccountModel accountModel);

  Future<AccountModel> getAccount();

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
  Future<bool> saveAccount(AccountModel accountModel) async {
    final res = await SpUtil.putObject(
      PreferencesKeys.account,
      accountModel.toJson(),
    );
    return res ?? false;
  }

  @override
  Future<AccountModel> getAccount() async {
    final res = SpUtil.getObject(
      PreferencesKeys.account,
    ) as Map<String, dynamic>;
    return AccountModel.fromJson(res);
  }

  @override
  Future<bool> clear() async {
    final res = await SpUtil.clear();
    return res ?? false;
  }
}

import 'package:covid_overcoming/data/datasource/local/pref/app_preferences.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalCacheRepository)
class LocalCacheRepositoryImpl implements LocalCacheRepository {
  const LocalCacheRepositoryImpl(this.appPref);

  final AppPreferences appPref;

  @override
  Future<AccountModel> getAccount() async {
    return appPref.getAccount();
  }

  @override
  Future<bool> saveAccount(AccountModel accountModel) async {
    return appPref.saveAccount(accountModel);
  }

  @override
  Future<bool> clear() async {
    return appPref.clear();
  }
}

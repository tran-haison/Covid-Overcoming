import 'package:covid_overcoming/data/model/account/account_model.dart';

abstract class LocalCacheRepository {
  Future<AccountModel> getAccount();
  Future<bool> saveAccount(AccountModel accountModel);
  Future<bool> clear();
}

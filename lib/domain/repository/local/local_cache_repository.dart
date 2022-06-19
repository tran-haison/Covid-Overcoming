import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:either_dart/either.dart';

abstract class LocalCacheRepository {
  Future<Either<Error, AccountModel>> getAccount();
  Future<Either<Error, bool>> saveAccount(AccountModel accountModel);
  Future<Either<Error, bool>> clear();
}

import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/local/pref/app_preferences.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/repository/utils/data_constants.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalCacheRepository)
class LocalCacheRepositoryImpl implements LocalCacheRepository {
  const LocalCacheRepositoryImpl(this.appPref);

  final AppPreferences appPref;

  @override
  Future<Either<Error, AccountModel>> getAccount() async {
    return _localCacheMethodCall<AccountModel>(
      function: appPref.getAccount,
      errorMessage: DataConstants.errorGetLocalAccount,
    );
  }

  @override
  Future<Either<Error, bool>> saveAccount(AccountModel accountModel) async {
    return _localCacheMethodCall<bool>(
      function: () => appPref.saveAccount(accountModel),
      errorMessage: DataConstants.errorSaveLocalAccount,
    );
  }

  @override
  Future<Either<Error, bool>> clear() async {
    return _localCacheMethodCall<bool>(
      function: appPref.clear,
      errorMessage: DataConstants.errorClearCacheData,
    );
  }

  /// Generic function with error handling for local cache methods
  Future<Either<Error, T>> _localCacheMethodCall<T>({
    required Future<T> Function() function,
    required String errorMessage,
  }) async {
    try {
      final res = await function();
      return Right(res);
    } catch (e) {
      Log.e('$errorMessage\n${e.toString()}');
      return Left(CacheError(errorMessage));
    }
  }
}

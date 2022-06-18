import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/local/pref/app_preferences.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/data/repository/utils/data_constants.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalCacheRepository)
class LocalCacheRepositoryImpl implements LocalCacheRepository {
  const LocalCacheRepositoryImpl(this.appPref);

  final AppPreferences appPref;

  @override
  Future<Either<Error, UserModel>> getUser() async {
    return _localCacheMethodCall<UserModel>(
      function: appPref.getUser,
      errorMessage: DataConstants.errorGetLocalUser,
    );
  }

  @override
  Future<Either<Error, bool>> saveUser(UserModel userModel) async {
    return _localCacheMethodCall<bool>(
      function: () => appPref.saveUser(userModel),
      errorMessage: DataConstants.errorSaveLocalUser,
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
      Log.e(e.toString());
      return Left(CacheError(errorMessage));
    }
  }
}

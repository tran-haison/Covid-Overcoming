import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/local/db/app_database.dart';
import 'package:covid_overcoming/data/datasource/local/db/daos/app_dao.dart';
import 'package:covid_overcoming/data/repository/utils/data_constants.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:covid_overcoming/domain/repository/local/local_database_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalDatabaseRepository)
class LocalDatabaseRepositoryImpl implements LocalDatabaseRepository {
  const LocalDatabaseRepositoryImpl(this.appDatabase);

  final AppDatabase appDatabase;

  AppDao get _appDao => appDatabase.appDao;

  @override
  Future<Either<Error, List<Stage>>> getAllStages() async {
    return _localDatabaseMethodCall<List<Stage>>(
      function: _appDao.getAllStages,
      errorMessage: DataConstants.errorGetAllStages,
    );
  }

  Future<Either<Error, T>> _localDatabaseMethodCall<T>({
    required Future<T> Function() function,
    required String errorMessage,
  }) async {
    try {
      final res = await function();
      return Right(res);
    } catch (e) {
      Log.e(e.toString());
      return Left(DatabaseError(errorMessage));
    }
  }
}

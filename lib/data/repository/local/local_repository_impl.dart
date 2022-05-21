import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/local/local_datasource.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:covid_overcoming/domain/repository/local/local_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LocalRepository)
class LocalRepositoryImpl implements LocalRepository {
  const LocalRepositoryImpl(
    this.localDatasource,
  );

  final LocalDatasource localDatasource;

  @override
  Future<Either<Error, List<Stage>>> getAllStages() async {
    try {
      final list = await localDatasource.getAllStages();
      return Right(list);
    } catch (e) {
      Log.e(e.toString());
      return Left(DatabaseError(e.toString()));
    }
  }
}

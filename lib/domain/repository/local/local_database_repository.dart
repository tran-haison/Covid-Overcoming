import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:either_dart/either.dart';

abstract class LocalDatabaseRepository {
  Future<Either<Error, List<Stage>>> getAllStages();
}

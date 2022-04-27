import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/entity/stage.dart';
import 'package:either_dart/either.dart';

abstract class LocalRepository {
  Future<Either<Error, List<Stage>>> getAllStages();
}
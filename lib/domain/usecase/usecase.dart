import 'package:covid_overcoming/core/error/error.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<T, Params> {
  Future<Either<Error, T>> execute(Params params);
}

abstract class UseCaseNoParam<T> {
  Future<Either<Error, T>> execute();
}
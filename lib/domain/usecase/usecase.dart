import 'package:covid_overcoming/core/error/error.dart';
import 'package:either_dart/either.dart';

abstract class UseCase<T, P> {
  Future<Either<Error, T>> call(P params);
}

abstract class UseCaseNoParam<T> {
  Future<Either<Error, T>> call();
}

import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:either_dart/either.dart';

abstract class LocalCacheRepository {
  Future<Either<Error, UserModel>> getUser();
  Future<Either<Error, bool>> saveUser(UserModel userModel);
  Future<Either<Error, bool>> clear();
}

import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:either_dart/either.dart';

abstract class FirebaseRepository {
  Future<Either<Error, bool>> saveUser({
    required UserModel userModel,
    required bool shouldReplace,
  });

  Future<Either<Error, UserModel>> getUser(String uid);

  Future<Either<Error, bool>> checkUserExists(String uid);
}

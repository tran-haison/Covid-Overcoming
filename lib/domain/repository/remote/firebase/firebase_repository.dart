import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:either_dart/either.dart';

abstract class FirebaseRepository {
  Future<Either<Error, bool>> saveAccount({
    required AccountModel accountModel,
    required bool shouldReplace,
  });

  Future<Either<Error, AccountModel>> getAccount(String uid);

  Future<Either<Error, bool>> checkAccountExists(String uid);
}

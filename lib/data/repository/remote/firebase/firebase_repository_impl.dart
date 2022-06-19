import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_database_service.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/repository/utils/data_constants.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  const FirebaseRepositoryImpl(this.fireStoreDatabase);

  final FirestoreDatabaseService fireStoreDatabase;

  @override
  Future<Either<Error, bool>> saveAccount({
    required AccountModel accountModel,
    required bool shouldReplace,
  }) async {
    return _firebaseMethodCall<bool>(
      function: () async {
        final isAccountExisted = await fireStoreDatabase.checkAccountExists(
          accountModel.uid,
        );
        if (!isAccountExisted || (isAccountExisted && shouldReplace)) {
          await fireStoreDatabase.saveAccount(accountModel);
          return const Right(true);
        }
        return const Right(false);
      },
      errorMessage: DataConstants.errorSaveAccount,
    );
  }

  @override
  Future<Either<Error, AccountModel>> getAccount(String uid) async {
    return _firebaseMethodCall<AccountModel>(
      function: () async => Right(await fireStoreDatabase.getAccount(uid)),
      errorMessage: DataConstants.errorGetAccount,
    );
  }

  @override
  Future<Either<Error, bool>> checkAccountExists(String uid) async {
    return _firebaseMethodCall<bool>(
      function: () async => Right(
        await fireStoreDatabase.checkAccountExists(uid),
      ),
      errorMessage: DataConstants.errorCheckAccountExists,
    );
  }

  /// Generic function with error handling for firebase methods
  Future<Either<Error, T>> _firebaseMethodCall<T>({
    required Future<Either<Error, T>> Function() function,
    required String errorMessage,
  }) async {
    try {
      return function();
    } catch (e) {
      Log.e('$errorMessage\n${e.toString()}');
      return Left(FirebaseError(errorMessage));
    }
  }
}

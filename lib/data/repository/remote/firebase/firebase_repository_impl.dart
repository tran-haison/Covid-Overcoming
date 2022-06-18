import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_database_service.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/data/repository/utils/data_constants.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  const FirebaseRepositoryImpl(this.fireStoreDatabase);

  final FirestoreDatabaseService fireStoreDatabase;

  @override
  Future<Either<Error, bool>> saveUser({
    required UserModel userModel,
    required bool shouldReplace,
  }) async {
    return _firebaseMethodCall<bool>(
      function: () async {
        final isUserExisted = await fireStoreDatabase.checkUserExists(
          userModel.uid,
        );
        if (!isUserExisted || (isUserExisted && shouldReplace)) {
          await fireStoreDatabase.saveUser(userModel);
          return const Right(true);
        }
        return const Right(false);
      },
      errorMessage: DataConstants.errorSaveUser,
    );
  }

  @override
  Future<Either<Error, UserModel>> getUser(String uid) async {
    return _firebaseMethodCall<UserModel>(
      function: () async => Right(await fireStoreDatabase.getUser(uid)),
      errorMessage: DataConstants.errorGetUser,
    );
  }

  @override
  Future<Either<Error, bool>> checkUserExists(String uid) async {
    return _firebaseMethodCall<bool>(
      function: () async => Right(await fireStoreDatabase.checkUserExists(uid)),
      errorMessage: DataConstants.errorCheckUserExists,
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
      Log.e(e.toString());
      return Left(FirebaseError(errorMessage));
    }
  }
}

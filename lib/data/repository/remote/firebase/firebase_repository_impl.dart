import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_database_service.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/data/utils/data_constants.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  FirebaseRepositoryImpl(
    this._fireStoreDatabase,
  );

  final FirestoreDatabaseService _fireStoreDatabase;

  @override
  Future<Either<Error, bool>> saveUser(UserModel userModel) async {
    try {
      await _fireStoreDatabase.saveUser(userModel);
      return const Right(true);
    } catch (e) {
      return const Left(FirebaseError(DataConstants.errorSaveUser));
    }
  }

  @override
  Future<Either<Error, UserModel>> getUser(String uid) async {
    try {
      final user = await _fireStoreDatabase.getUser(uid);
      return Right(user);
    } catch (e) {
      return const Left(FirebaseError(DataConstants.errorGetUser));
    }
  }

  @override
  Future<Either<Error, bool>> checkUserExists(String uid) async {
    try {
      final isUserExisted = await _fireStoreDatabase.checkUserExists(uid);
      return Right(isUserExisted);
    } catch (e) {
      return const Left(FirebaseError(DataConstants.errorCheckUserExists));
    }
  }
}

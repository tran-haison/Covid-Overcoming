import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUseCase extends UseCase<UserModel, String> {
  GetUserUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, UserModel>> call(String params) {
    return _firebaseRepository.getUser(params);
  }
}

@injectable
class SaveUserUseCase extends UseCase<bool, FirebaseSaveUserParams> {
  SaveUserUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, bool>> call(FirebaseSaveUserParams params) {
    return _firebaseRepository.saveUser(
      userModel: params.userModel,
      shouldReplace: params.shouldReplace,
    );
  }
}

@injectable
class CheckUserExistsUseCase extends UseCase<bool, String> {
  CheckUserExistsUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, bool>> call(String params) {
    return _firebaseRepository.checkUserExists(params);
  }
}

class FirebaseSaveUserParams {
  const FirebaseSaveUserParams({
    required this.userModel,
    required this.shouldReplace,
  });

  final UserModel userModel;
  final bool shouldReplace;
}

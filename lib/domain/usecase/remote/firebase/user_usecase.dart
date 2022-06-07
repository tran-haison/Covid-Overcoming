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
class SaveUserUseCase extends UseCase<bool, UserModel> {
  SaveUserUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, bool>> call(UserModel params) {
    return _firebaseRepository.saveUser(params);
  }
}

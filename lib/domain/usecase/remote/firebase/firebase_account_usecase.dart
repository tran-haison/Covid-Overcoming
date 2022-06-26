import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAccountUseCase extends UseCase<AccountModel, String> {
  GetAccountUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, AccountModel>> call(String params) {
    return _firebaseRepository.getAccount(params);
  }
}

@injectable
class SaveAccountUseCase extends UseCase<bool, FirebaseSaveAccountParams> {
  SaveAccountUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, bool>> call(FirebaseSaveAccountParams params) {
    return _firebaseRepository.saveAccount(
      accountModel: params.accountModel,
      shouldReplace: params.shouldReplace,
    );
  }
}

@injectable
class CheckAccountExistsUseCase extends UseCase<bool, String> {
  CheckAccountExistsUseCase(this._firebaseRepository);

  final FirebaseRepository _firebaseRepository;

  @override
  Future<Either<Error, bool>> call(String params) {
    return _firebaseRepository.checkAccountExists(params);
  }
}

class FirebaseSaveAccountParams {
  const FirebaseSaveAccountParams({
    required this.accountModel,
    required this.shouldReplace,
  });

  final AccountModel accountModel;
  final bool shouldReplace;
}

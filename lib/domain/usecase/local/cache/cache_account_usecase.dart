import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocalAccountUseCase extends UseCaseNoParam<AccountModel> {
  GetLocalAccountUseCase(this.localCacheRepository);

  final LocalCacheRepository localCacheRepository;

  @override
  Future<Either<Error, AccountModel>> call() async {
    return localCacheRepository.getAccount();
  }
}

@injectable
class SaveLocalAccountUseCase extends UseCase<bool, AccountModel> {
  SaveLocalAccountUseCase(this.localCacheRepository);

  final LocalCacheRepository localCacheRepository;

  @override
  Future<Either<Error, bool>> call(AccountModel params) {
    return localCacheRepository.saveAccount(params);
  }
}

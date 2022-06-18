import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocalUserUseCase extends UseCaseNoParam<UserModel> {
  GetLocalUserUseCase(this.localCacheRepository);

  final LocalCacheRepository localCacheRepository;

  @override
  Future<Either<Error, UserModel>> call() async {
    return localCacheRepository.getUser();
  }
}

@injectable
class SaveLocalUserUseCase extends UseCase<bool, UserModel> {
  SaveLocalUserUseCase(this.localCacheRepository);

  final LocalCacheRepository localCacheRepository;

  @override
  Future<Either<Error, bool>> call(UserModel params) {
    return localCacheRepository.saveUser(params);
  }
}

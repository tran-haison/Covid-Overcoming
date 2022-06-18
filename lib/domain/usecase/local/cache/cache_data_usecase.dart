import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearCacheDataUseCase extends UseCaseNoParam<bool> {
  ClearCacheDataUseCase(this.localCacheRepository);

  final LocalCacheRepository localCacheRepository;

  @override
  Future<Either<Error, bool>> call() async {
    return localCacheRepository.clear();
  }
}

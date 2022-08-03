import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:covid_overcoming/domain/repository/local/local_database_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllStagesUseCase implements UseCaseNoParam<List<Stage>> {
  const GetAllStagesUseCase(this._localRepository);

  final LocalDatabaseRepository _localRepository;

  @override
  Future<Either<Error, List<Stage>>> call() {
    return _localRepository.getAllStages();
  }
}

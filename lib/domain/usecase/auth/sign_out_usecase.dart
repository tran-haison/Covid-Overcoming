import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/repository/auth/auth_repository.dart';
import 'package:covid_overcoming/domain/usecase/usecase.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase implements UseCaseNoParam<bool> {
  const SignOutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Either<Error, bool>> call() {
    return _authRepository.signOut();
  }
}